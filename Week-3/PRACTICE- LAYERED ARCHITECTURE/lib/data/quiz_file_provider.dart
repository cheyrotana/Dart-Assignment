import '../domain/quiz.dart';
import 'dart:io';
import 'dart:convert';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  Quiz readQuiz() {
    final file = File(filePath);
    final content = file.readAsStringSync();
    final data = jsonDecode(content);

    var questionsJson = data['questions'] as List;
    var questions = questionsJson.map((q) {
      return Question(
        id: q['id'],
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        point: q['points'],
      );
    }).toList();

    List<Player> players = [];
    if (data.containsKey('playerAttempts')) {
      var playersJson = data['playerAttempts'] as List;
      for (var p in playersJson) {
        var answersJson = p['answers'] as List;
        var answers = answersJson.map((a) {
          return Answer(
            id: a['id'],
            questionId: a['questionId'],
            answerChoice: a['answerChoice'],
          );
        }).toList();

        var player = Player(
          id: p['id'],
          name: p['name'],
          answers: answers,
        );
        players.add(player);
      }
    }

    var quiz = Quiz(
      id: data['id'],
      questions: questions,
      players: players,
    );

    return quiz;
  }

  void writeQuiz(Quiz quiz) {
    var questionsJson = quiz.questions.map((q) {
      return {
        'id': q.id,
        'title': q.title,
        'choices': q.choices,
        'goodChoice': q.goodChoice,
        'points': q.point,
      };
    }).toList();

    var playersJson = quiz.players.map((p) {
      var answersJson = p.answers.map((a) {
        return {
          'id': a.id,
          'questionId': a.questionId,
          'answerChoice': a.answerChoice,
        };
      }).toList();

      return {
        'id': p.id,
        'name': p.name,
        'answers': answersJson,
      };
    }).toList();

    var data = {
      'id': quiz.id,
      'questions': questionsJson,
      'playerAttempts': playersJson,
    };

    final file = File(filePath);
    final jsonString = JsonEncoder.withIndent('  ').convert(data);
    file.writeAsStringSync(jsonString);
  }
}
