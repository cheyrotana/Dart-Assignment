import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Player {
  final String _id;
  final String name;
  final List<Answer> answers;

  Player({
    required this.name,
    List<Answer>? answers,
    String? id,
  })  : answers = answers ?? [],
        _id = id ?? uuid.v4();

  String get id => _id;

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getTotalScore(Quiz quiz) {
    int totalScore = 0;
    for (Answer answer in answers) {
      Question? question = quiz.getQuestionById(answer.questionId);
      if (question != null && answer.isGood(question)) {
        totalScore += question.point;
      }
    }
    return totalScore;
  }

  int getScoreInPercentage(Quiz quiz) {
    int maxScore = 0;
    for (Answer answer in answers) {
      Question? question = quiz.getQuestionById(answer.questionId);
      if (question != null) {
        maxScore += question.point;
      }
    }
    if (maxScore == 0) return 0;
    return ((getTotalScore(quiz) / maxScore) * 100).toInt();
  }
}

class Question {
  final String _id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question({
    required this.title,
    required this.choices,
    required this.goodChoice,
    this.point = 1,
    String? id,
  }) : _id = id ?? uuid.v4();

  String get id => _id;
}

class Answer {
  final String _id;
  final String questionId;
  final String answerChoice;

  Answer({
    required this.questionId,
    required this.answerChoice,
    String? id,
  }) : _id = id ?? uuid.v4();

  bool isGood(Question question) {
    return this.answerChoice == question.goodChoice;
  }

  String get id => _id;
}

class Quiz {
  final String _id;
  final List<Question> questions;
  final List<Player> players;

  Quiz({
    required this.questions,
    List<Player>? players,
    String? id,
  })  : players = players ?? [],
        _id = id ?? uuid.v4();

  String get id => _id;

  void addPlayer(Player player) {
    players.removeWhere((p) => p.name == player.name);
    players.add(player);
  }

  Question? getQuestionById(String id) {
    try {
      return questions.firstWhere((question) => question.id == id);
    } catch (e) {
      return null;
    }
  }
}
