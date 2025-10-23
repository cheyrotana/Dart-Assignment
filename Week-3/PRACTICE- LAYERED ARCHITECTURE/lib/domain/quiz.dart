import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Question {
  final String _id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question(
      {required this.title,
      required this.choices,
      required this.goodChoice,
      this.point = 1,
      String? id}) : _id = id ?? uuid.v4();

  String get id => this._id;  
}

class Answer {
  final String _id;
  final Question question;
  final String answerChoice;

  Answer({required this.question, required this.answerChoice, String? id}) : _id = id ?? uuid.v4();

  bool isGood() {
    return this.answerChoice == question.goodChoice;
  }

  String get id => this._id;
}

class Quiz {
  List<Question> questions;
  List<Answer> answers = [];

  Quiz({required this.questions});

  void addAnswer(Answer asnwer) {
    this.answers.add(asnwer);
  }

  int getScoreInPercentage() {
    int maxScore = 0;
    for (Answer answer in answers) {
      maxScore += answer.question.point;
    }
    return ((getTotalScore() / maxScore) * 100).toInt();
  }

  int getTotalScore() {
    int totalScore = 0;
    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalScore += answer.question.point;
      }
    }
    return totalScore;
  }

  void clearAnswers() {
    answers.clear();
  }
}

class Player {
  String? name;
  int? score;

  Player({this.name, this.score});

  @override
  String toString() => name ?? '';
}
