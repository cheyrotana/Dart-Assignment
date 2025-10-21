import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;
  List<Player> players = [];

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---');
    bool loopFlag = true;

    while (loopFlag) {
      stdout.write('Your name: ');
      String? nameInput = stdin.readLineSync();
      if (nameInput != null && nameInput.isNotEmpty) {
        Player player = Player(name: nameInput);

        for (var question in quiz.questions) {
          print('Question: ${question.title} - (${question.point} points)');
          print('Choices: ${question.choices}');
          stdout.write('Your answer: ');
          String? userInput = stdin.readLineSync();
          // Check for null input
          if (userInput != null && userInput.isNotEmpty) {
            Answer answer = Answer(question: question, answerChoice: userInput);
            quiz.addAnswer(answer);
          } else {
            print('No answer entered. Skipping question.');
          }
          print('');
        }

        int scoreInPercentage = quiz.getScoreInPercentage();
        int scoreInNumber = quiz.getTotalScore();
        player.score = scoreInNumber;

        print('${player.name}, Your score: $scoreInPercentage % correct');
        print('${player.name}, Your score: $scoreInNumber');

        quiz.clearAnswers();

        for (Player p in players) {
          print('Player: ${p.name}\t\t\tScore: ${p.score}');
        }
        print('');
      } else {
        loopFlag = false;
        print('');
        print('--------- Quiz Finished ------------');
      }
    }
  }
}
