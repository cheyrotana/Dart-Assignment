import 'question_model.dart';

class Answer {
  final Question question;
  final String answerChoice;

  Answer({required this.question, required this.answerChoice});

  bool isCorrect() {
    return answerChoice == question.goodChoice;
  }
}
