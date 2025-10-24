import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---');
    bool loopFlag = true;

    while (loopFlag) {
      stdout.write('Your name: ');

      String? nameInput = stdin.readLineSync();

      if (nameInput != null && nameInput.isNotEmpty) {
        Player player = Player(name: nameInput);
        quiz.addPlayer(player); 

        for (var question in quiz.questions) {
          print('Question: ${question.title} - (${question.point} points)');
          print('Choices: ${question.choices}');
          stdout.write('Your answer: ');
          String? userInput = stdin.readLineSync();

          if (userInput != null && userInput.isNotEmpty) {
            Answer answer = Answer(
              questionId: question.id,
              answerChoice: userInput,
            );
            player.addAnswer(answer);
          } else {
            print('No answer entered. Skipping question.');
          }
          print('');
        }

        int scoreInNumber = player.getTotalScore(quiz);
        int scoreInPercentage = player.getScoreInPercentage(quiz);

        print('$nameInput, Your score: $scoreInPercentage% correct');
        print('$nameInput, Your score: $scoreInNumber points\n');

        for (Player p in quiz.players) {
          int playerScore = p.getTotalScore(quiz);
          print('Player: ${p.name}\t\t\tScore: $playerScore');
        }
        print('');
      } else {
        loopFlag = false;
        print('--------- Quiz Finished ------------');
      }
    }
  }
}
