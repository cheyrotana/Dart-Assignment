import '../lib/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  Question q1 = Question(
      title: "Capital of France?",
      choices: ["Paris", "London", "Rome"],
      goodChoice: "Paris",
      point: 50);
  Question q2 = Question(
      title: "2 + 2 = ?", choices: ["2", "4", "5"], goodChoice: "4", point: 50);

  Quiz quiz = Quiz(questions: [q1, q2]);

  // Test single player - Perfect score
  test('Single Player', () {
    quiz.clearAnswers();
    Answer a1 =
        Answer(questionId: q1.id, answerChoice: "Paris", playerName: "Alice");
    Answer a2 =
        Answer(questionId: q2.id, answerChoice: "4", playerName: "Alice");

    quiz.answers = [a1, a2];

    expect(quiz.getTotalScoreForPlayer("Alice"), equals(100));
    expect(quiz.getScoreInPercentageForPlayer("Alice"), equals(100));
  });

  // Test single player - Only Q1 correct (Paris + 5)
  test('Single Player', () {
    quiz.clearAnswers();
    Answer a1 =
        Answer(questionId: q1.id, answerChoice: "Paris", playerName: "Bob");
    Answer a2 = Answer(questionId: q2.id, answerChoice: "5", playerName: "Bob");

    quiz.answers = [a1, a2];

    expect(quiz.getTotalScoreForPlayer("Bob"), equals(50));
    expect(quiz.getScoreInPercentageForPlayer("Bob"), equals(50));
  });

  // Test single player - Only Q1 correct (Paris + 2)
  test('Single Player', () {
    quiz.clearAnswers();
    Answer a1 =
        Answer(questionId: q1.id, answerChoice: "Paris", playerName: "Emma");
    Answer a2 =
        Answer(questionId: q2.id, answerChoice: "2", playerName: "Emma");

    quiz.answers = [a1, a2];

    expect(quiz.getTotalScoreForPlayer("Emma"), equals(50));
    expect(quiz.getScoreInPercentageForPlayer("Emma"), equals(50));
  });

  // Test single player - Only Q2 correct (Rome)
  test('Single Player', () {
    quiz.clearAnswers();
    Answer a1 =
        Answer(questionId: q1.id, answerChoice: "Rome", playerName: "Charlie");
    Answer a2 =
        Answer(questionId: q2.id, answerChoice: "4", playerName: "Charlie");

    quiz.answers = [a1, a2];

    expect(quiz.getTotalScoreForPlayer("Charlie"), equals(50));
    expect(quiz.getScoreInPercentageForPlayer("Charlie"), equals(50));
  });

  // Test single player - Only Q2 correct (London)
  test('Single Player', () {
    quiz.clearAnswers();
    Answer a1 =
        Answer(questionId: q1.id, answerChoice: "London", playerName: "David");
    Answer a2 =
        Answer(questionId: q2.id, answerChoice: "4", playerName: "David");

    quiz.answers = [a1, a2];

    expect(quiz.getTotalScoreForPlayer("David"), equals(50));
    expect(quiz.getScoreInPercentageForPlayer("David"), equals(50));
  });

  // Test single player - All wrong (London + 2)
  test('Single Player', () {
    quiz.clearAnswers();
    Answer a1 =
        Answer(questionId: q1.id, answerChoice: "London", playerName: "Diana");
    Answer a2 =
        Answer(questionId: q2.id, answerChoice: "2", playerName: "Diana");

    quiz.answers = [a1, a2];

    expect(quiz.getTotalScoreForPlayer("Diana"), equals(0));
    expect(quiz.getScoreInPercentageForPlayer("Diana"), equals(0));
  });

  // Test single player - All wrong (London + 5)
  test('Single Player', () {
    quiz.clearAnswers();
    Answer a1 =
        Answer(questionId: q1.id, answerChoice: "London", playerName: "Frank");
    Answer a2 =
        Answer(questionId: q2.id, answerChoice: "5", playerName: "Frank");

    quiz.answers = [a1, a2];

    expect(quiz.getTotalScoreForPlayer("Frank"), equals(0));
    expect(quiz.getScoreInPercentageForPlayer("Frank"), equals(0));
  });

  // Test single player - All wrong (Rome + 2)
  test('Single Player', () {
    quiz.clearAnswers();
    Answer a1 =
        Answer(questionId: q1.id, answerChoice: "Rome", playerName: "Grace");
    Answer a2 =
        Answer(questionId: q2.id, answerChoice: "2", playerName: "Grace");

    quiz.answers = [a1, a2];

    expect(quiz.getTotalScoreForPlayer("Grace"), equals(0));
    expect(quiz.getScoreInPercentageForPlayer("Grace"), equals(0));
  });

  // Test single player - All wrong (Rome + 5)
  test('Single Player', () {
    quiz.clearAnswers();
    Answer a1 =
        Answer(questionId: q1.id, answerChoice: "Rome", playerName: "Henry");
    Answer a2 =
        Answer(questionId: q2.id, answerChoice: "5", playerName: "Henry");

    quiz.answers = [a1, a2];

    expect(quiz.getTotalScoreForPlayer("Henry"), equals(0));
    expect(quiz.getScoreInPercentageForPlayer("Henry"), equals(0));
  });

  // Test multiple players 100%, 50%, 0%
  test('Multiple Players ', () {
    quiz.clearAnswers();

    // Player 1: Perfect score (100% = 100 points)
    Answer a1_p1 =
        Answer(questionId: q1.id, answerChoice: "Paris", playerName: "Player1");
    Answer a2_p1 =
        Answer(questionId: q2.id, answerChoice: "4", playerName: "Player1");

    // Player 2: Only Q1 correct (50% = 50 points)
    Answer a1_p2 =
        Answer(questionId: q1.id, answerChoice: "Paris", playerName: "Player2");
    Answer a2_p2 =
        Answer(questionId: q2.id, answerChoice: "2", playerName: "Player2");

    // Player 3: Only Q2 correct (50% = 50 points)
    Answer a1_p3 =
        Answer(questionId: q1.id, answerChoice: "Rome", playerName: "Player3");
    Answer a2_p3 =
        Answer(questionId: q2.id, answerChoice: "4", playerName: "Player3");

    // Player 4: All wrong (0% = 0 points)
    Answer a1_p4 = Answer(
        questionId: q1.id, answerChoice: "London", playerName: "Player4");
    Answer a2_p4 =
        Answer(questionId: q2.id, answerChoice: "5", playerName: "Player4");

    quiz.answers = [a1_p1, a2_p1, a1_p2, a2_p2, a1_p3, a2_p3, a1_p4, a2_p4];

    // Check Player1 (100% = 100 points)
    expect(quiz.getTotalScoreForPlayer("Player1"), equals(100));
    expect(quiz.getScoreInPercentageForPlayer("Player1"), equals(100));

    // Check Player2 (50% = 50 points)
    expect(quiz.getTotalScoreForPlayer("Player2"), equals(50));
    expect(quiz.getScoreInPercentageForPlayer("Player2"), equals(50));

    // Check Player3 (50% = 50 points)
    expect(quiz.getTotalScoreForPlayer("Player3"), equals(50));
    expect(quiz.getScoreInPercentageForPlayer("Player3"), equals(50));

    // Check Player4 (0% = 0 points)
    expect(quiz.getTotalScoreForPlayer("Player4"), equals(0));
    expect(quiz.getScoreInPercentageForPlayer("Player4"), equals(0));
  });

  // Test multiple players - All get 100%
  test('Multiple Players', () {
    quiz.clearAnswers();

    Answer a1_p1 =
        Answer(questionId: q1.id, answerChoice: "Paris", playerName: "Winner1");
    Answer a2_p1 =
        Answer(questionId: q2.id, answerChoice: "4", playerName: "Winner1");
    Answer a1_p2 =
        Answer(questionId: q1.id, answerChoice: "Paris", playerName: "Winner2");
    Answer a2_p2 =
        Answer(questionId: q2.id, answerChoice: "4", playerName: "Winner2");
    Answer a1_p3 =
        Answer(questionId: q1.id, answerChoice: "Paris", playerName: "Winner3");
    Answer a2_p3 =
        Answer(questionId: q2.id, answerChoice: "4", playerName: "Winner3");

    quiz.answers = [a1_p1, a2_p1, a1_p2, a2_p2, a1_p3, a2_p3];

    expect(quiz.getTotalScoreForPlayer("Winner1"), equals(100));
    expect(quiz.getScoreInPercentageForPlayer("Winner1"), equals(100));
    expect(quiz.getTotalScoreForPlayer("Winner2"), equals(100));
    expect(quiz.getScoreInPercentageForPlayer("Winner2"), equals(100));
    expect(quiz.getTotalScoreForPlayer("Winner3"), equals(100));
    expect(quiz.getScoreInPercentageForPlayer("Winner3"), equals(100));
  });

  // Test multiple players - All get 50% (different combinations)
  test('Multiple Players', () {
    quiz.clearAnswers();

    // Player A: Paris + 5 (Q1 correct)
    Answer a1_pA =
        Answer(questionId: q1.id, answerChoice: "Paris", playerName: "PlayerA");
    Answer a2_pA =
        Answer(questionId: q2.id, answerChoice: "5", playerName: "PlayerA");

    // Player B: Paris + 2 (Q1 correct)
    Answer a1_pB =
        Answer(questionId: q1.id, answerChoice: "Paris", playerName: "PlayerB");
    Answer a2_pB =
        Answer(questionId: q2.id, answerChoice: "2", playerName: "PlayerB");

    // Player C: Rome + 4 (Q2 correct)
    Answer a1_pC =
        Answer(questionId: q1.id, answerChoice: "Rome", playerName: "PlayerC");
    Answer a2_pC =
        Answer(questionId: q2.id, answerChoice: "4", playerName: "PlayerC");

    // Player D: London + 4 (Q2 correct)
    Answer a1_pD = Answer(
        questionId: q1.id, answerChoice: "London", playerName: "PlayerD");
    Answer a2_pD =
        Answer(questionId: q2.id, answerChoice: "4", playerName: "PlayerD");

    quiz.answers = [a1_pA, a2_pA, a1_pB, a2_pB, a1_pC, a2_pC, a1_pD, a2_pD];

    expect(quiz.getTotalScoreForPlayer("PlayerA"), equals(50));
    expect(quiz.getScoreInPercentageForPlayer("PlayerA"), equals(50));
    expect(quiz.getTotalScoreForPlayer("PlayerB"), equals(50));
    expect(quiz.getScoreInPercentageForPlayer("PlayerB"), equals(50));
    expect(quiz.getTotalScoreForPlayer("PlayerC"), equals(50));
    expect(quiz.getScoreInPercentageForPlayer("PlayerC"), equals(50));
    expect(quiz.getTotalScoreForPlayer("PlayerD"), equals(50));
    expect(quiz.getScoreInPercentageForPlayer("PlayerD"), equals(50));
  });

  // Test multiple players - All fail (0%) with different combinations
  test('Multiple Players', () {
    quiz.clearAnswers();

    Answer a1_p1 =
        Answer(questionId: q1.id, answerChoice: "London", playerName: "Fail1");
    Answer a2_p1 =
        Answer(questionId: q2.id, answerChoice: "2", playerName: "Fail1");
    Answer a1_p2 =
        Answer(questionId: q1.id, answerChoice: "Rome", playerName: "Fail2");
    Answer a2_p2 =
        Answer(questionId: q2.id, answerChoice: "5", playerName: "Fail2");
    Answer a1_p3 =
        Answer(questionId: q1.id, answerChoice: "London", playerName: "Fail3");
    Answer a2_p3 =
        Answer(questionId: q2.id, answerChoice: "5", playerName: "Fail3");
    Answer a1_p4 =
        Answer(questionId: q1.id, answerChoice: "Rome", playerName: "Fail4");
    Answer a2_p4 =
        Answer(questionId: q2.id, answerChoice: "2", playerName: "Fail4");

    quiz.answers = [a1_p1, a2_p1, a1_p2, a2_p2, a1_p3, a2_p3, a1_p4, a2_p4];

    expect(quiz.getTotalScoreForPlayer("Fail1"), equals(0));
    expect(quiz.getScoreInPercentageForPlayer("Fail1"), equals(0));
    expect(quiz.getTotalScoreForPlayer("Fail2"), equals(0));
    expect(quiz.getScoreInPercentageForPlayer("Fail2"), equals(0));
    expect(quiz.getTotalScoreForPlayer("Fail3"), equals(0));
    expect(quiz.getScoreInPercentageForPlayer("Fail3"), equals(0));
    expect(quiz.getTotalScoreForPlayer("Fail4"), equals(0));
    expect(quiz.getScoreInPercentageForPlayer("Fail4"), equals(0));
  });
}
