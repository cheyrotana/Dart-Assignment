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
// Map JSON to domain objects
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

    var answersJson = data['answers'] as List;
    var answers = answersJson.map((a) {
      var questionId = a['questionId'];

      return Answer(
        id: a['id'],
        questionId: questionId,
        answerChoice: a['answerChoice'],
        playerName: a['playerName'],
      );
    }).toList();

    var quiz = Quiz(questions: questions);
    for (var answer in answers) {
      quiz.addAnswer(answer);
    }

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

    var answersJson = quiz.answers.map((a) {
      return {
        'id': a.id,
        'questionId': a.questionId,
        'answerChoice': a.answerChoice,
        'playerName': a.playerName,
      };
    }).toList();

    var data = {
      'id': quiz.id,
      'questions': questionsJson,
      'answers': answersJson,
    };

    final file = File(filePath);
    final jsonString = JsonEncoder.withIndent('  ').convert(data);
    file.writeAsStringSync(jsonString);
  }
}
