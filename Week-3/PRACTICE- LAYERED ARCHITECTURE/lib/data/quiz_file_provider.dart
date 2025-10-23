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

    var questionMap = {for (var q in questions) q.id: q};

    var answersJson = data['answers'] as List;
    var answers = answersJson.map((a) {
      var questionId = a['questionId'];
      var question = questionMap[questionId];

      return Answer(
        id: a['id'],
        question: question!,
        answerChoice: a['answerChoice'],
      );
    }).toList();

    var quiz = Quiz(questions: questions);
    for (var answer in answers) {
      quiz.addAnswer(answer);
    }

    return quiz;
  }
}
