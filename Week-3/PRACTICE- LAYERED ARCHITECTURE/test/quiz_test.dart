import '../lib/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  test('Single Player', () {
    Question q1 = Question(
        title: "Capital of France?",
        choices: ["Paris", "London", "Rome"],
        goodChoice: "Paris",
        point: 50);
    Question q2 = Question(
        title: "2 + 2 = ?",
        choices: ["2", "4", "5"],
        goodChoice: "4",
        point: 50);

    Quiz quiz = Quiz(questions: [q1, q2]);

    Player dog = Player(name: "Dog");
    dog.addAnswer(Answer(questionId: q1.id, answerChoice: "Paris"));
    dog.addAnswer(Answer(questionId: q2.id, answerChoice: "4"));
    quiz.addPlayer(dog);

    expect(dog.getTotalScore(quiz), equals(100));
    expect(dog.getScoreInPercentage(quiz), equals(100));
  });
  test('Single Player', () {
    Question q1 = Question(
        title: "Capital of France?",
        choices: ["Paris", "London", "Rome"],
        goodChoice: "Paris",
        point: 50);
    Question q2 = Question(
        title: "2 + 2 = ?",
        choices: ["2", "4", "5"],
        goodChoice: "4",
        point: 50);

    Quiz quiz = Quiz(questions: [q1, q2]);

    Player cat = Player(name: "Cat");
    cat.addAnswer(Answer(questionId: q1.id, answerChoice: "Paris"));
    cat.addAnswer(Answer(questionId: q2.id, answerChoice: "5"));
    quiz.addPlayer(cat);

    expect(cat.getTotalScore(quiz), equals(50));
    expect(cat.getScoreInPercentage(quiz), equals(50));
  });

  // Test single player
  test('Single Player', () {
    Question q1 = Question(
        title: "Capital of France?",
        choices: ["Paris", "London", "Rome"],
        goodChoice: "Paris",
        point: 50);
    Question q2 = Question(
        title: "2 + 2 = ?",
        choices: ["2", "4", "5"],
        goodChoice: "4",
        point: 50);

    Quiz quiz = Quiz(questions: [q1, q2]);

    Player bat = Player(name: "Bat");
    bat.addAnswer(Answer(questionId: q1.id, answerChoice: "London"));
    bat.addAnswer(Answer(questionId: q2.id, answerChoice: "2"));
    quiz.addPlayer(bat);

    expect(bat.getTotalScore(quiz), equals(0));
    expect(bat.getScoreInPercentage(quiz), equals(0));
  });

  // Test multiple players with different scores
  test('Multiple Players', () {
    Question q1 = Question(
        title: "Capital of France?",
        choices: ["Paris", "London", "Rome"],
        goodChoice: "Paris",
        point: 50);
    Question q2 = Question(
        title: "2 + 2 = ?",
        choices: ["2", "4", "5"],
        goodChoice: "4",
        point: 50);

    Quiz quiz = Quiz(questions: [q1, q2]);

    // Player 1: Perfect score
    Player player1 = Player(name: "Player1");
    player1.addAnswer(Answer(questionId: q1.id, answerChoice: "Paris"));
    player1.addAnswer(Answer(questionId: q2.id, answerChoice: "4"));
    quiz.addPlayer(player1);

    // Player 2: Partial score
    Player player2 = Player(name: "Player2");
    player2.addAnswer(Answer(questionId: q1.id, answerChoice: "Paris"));
    player2.addAnswer(Answer(questionId: q2.id, answerChoice: "2"));
    quiz.addPlayer(player2);

    // Player 3: Zero score
    Player player3 = Player(name: "Player3");
    player3.addAnswer(Answer(questionId: q1.id, answerChoice: "London"));
    player3.addAnswer(Answer(questionId: q2.id, answerChoice: "5"));
    quiz.addPlayer(player3);

    expect(player1.getTotalScore(quiz), equals(100));
    expect(player1.getScoreInPercentage(quiz), equals(100));

    expect(player2.getTotalScore(quiz), equals(50));
    expect(player2.getScoreInPercentage(quiz), equals(50));

    expect(player3.getTotalScore(quiz), equals(0));
    expect(player3.getScoreInPercentage(quiz), equals(0));
  });
}
