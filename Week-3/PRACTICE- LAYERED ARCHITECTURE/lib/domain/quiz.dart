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
      String? id})
      : _id = id ?? uuid.v4();

  String get id => _id;
}

class Answer {
  final String _id;
  final String questionId;
  final String answerChoice;
  final String playerName;

  Answer(
      {required this.questionId,
      required this.answerChoice,
      required this.playerName,
      String? id})
      : _id = id ?? uuid.v4();

  bool isGood(Quiz quiz) {
    Question? question = quiz.getQuestionById(questionId);
    if (question == null) return false;
    return this.answerChoice == question.goodChoice;
  }

  String get id => _id;
}

class Quiz {
  final String _id;
  List<Question> questions;
  List<Answer> answers = [];

  Quiz({required this.questions, String? id}) : _id = id ?? uuid.v4();

  String get id => _id;

  void addAnswer(Answer asnwer) {
    this.answers.add(asnwer);
  }

  Question? getQuestionById(String id) {
    try {
      return questions.firstWhere((question) => question.id == id);
    } catch (e) {
      return null;
    }
  }

  Answer? getAnswerById(String id) {
    try {
      return answers.firstWhere((answer) => answer.id == id);
    } catch (e) {
      return null;
    }
  }

  int getScoreInPercentage() {
    int maxScore = 0;
    for (Answer answer in answers) {
      Question? question = getQuestionById(answer.questionId);
      if (question != null) {
        maxScore += question.point;
      }
    }
    if (maxScore == 0) return 0;
    return ((getTotalScore() / maxScore) * 100).toInt();
  }

  int getTotalScore() {
    int totalScore = 0;
    for (Answer answer in answers) {
      if (answer.isGood(this)) {
        Question? question = getQuestionById(answer.questionId);
        if (question != null) {
          totalScore += question.point;
        }
      }
    }
    return totalScore;
  }

  int getTotalScoreForPlayer(String playerName) {
    int totalScore = 0;
    for (Answer answer in answers) {
      if (answer.playerName == playerName && answer.isGood(this)) {
        Question? question = getQuestionById(answer.questionId);
        if (question != null) {
          totalScore += question.point;
        }
      }
    }
    return totalScore;
  }

  int getScoreInPercentageForPlayer(String playerName) {
    int maxScore = 0;
    for (Answer answer in answers) {
      if (answer.playerName == playerName) {
        Question? question = getQuestionById(answer.questionId);
        if (question != null) {
          maxScore += question.point;
        }
      }
    }
    if (maxScore == 0) return 0;
    return ((getTotalScoreForPlayer(playerName) / maxScore) * 100).toInt();
  }

  void clearAnswers() {
    answers.clear();
  }
}

class Player {
  String? name;
  int score;

  Player({this.name, this.score = 0});

  @override
  String toString() => name ?? '';
}
