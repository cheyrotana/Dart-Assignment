import '../lib/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  Question q1 = Question(
      title: "Capital of France?",
      choices: ["Paris", "London", "Rome"],
      goodChoice: "Paris");
  Question q2 =
      Question(title: "2 + 2 = ?", choices: ["2", "4", "5"], goodChoice: "4");

  Quiz quiz = Quiz(questions: [q1, q2]);
//100
  test('Perfect (100%)', () {
    Answer a1 = Answer(question: q1, answerChoice: "Paris");
    Answer a2 = Answer(question: q2, answerChoice: "4");

    quiz.answers = [a1, a2];
    expect(quiz.getScoreInPercentage(), equals(100));
  });
//50
  test('Good (50%)', () {
    Answer a1 = Answer(question: q1, answerChoice: "Rome");
    Answer a2 = Answer(question: q2, answerChoice: "4");

    quiz.answers = [a1, a2];
    expect(quiz.getScoreInPercentage(), equals(50));
  });

  test('Good (50%)', () {
    Answer a1 = Answer(question: q1, answerChoice: "London");
    Answer a2 = Answer(question: q2, answerChoice: "4");

    quiz.answers = [a1, a2];
    expect(quiz.getScoreInPercentage(), equals(50));
  });

  test('Good (50%)', () {
    Answer a1 = Answer(question: q1, answerChoice: "Paris");
    Answer a2 = Answer(question: q2, answerChoice: "5");

    quiz.answers = [a1, a2];
    expect(quiz.getScoreInPercentage(), equals(50));
  });

  test('Good (50%)', () {
    Answer a1 = Answer(question: q1, answerChoice: "Paris");
    Answer a2 = Answer(question: q2, answerChoice: "2");

    quiz.answers = [a1, a2];
    expect(quiz.getScoreInPercentage(), equals(50));
  });  
//0
  test('Fail (0%)', () {
    Answer a1 = Answer(question: q1, answerChoice: "Rome");
    Answer a2 = Answer(question: q2, answerChoice: "2");
    quiz.answers = [a1, a2];
    expect(quiz.getScoreInPercentage(), equals(0));
  });

  test('Fail (0%)', () {
    Answer a1 = Answer(question: q1, answerChoice: "Rome");
    Answer a2 = Answer(question: q2, answerChoice: "5");
    quiz.answers = [a1, a2];
    expect(quiz.getScoreInPercentage(), equals(0));
  });

  test('Fail (0%)', () {
    Answer a1 = Answer(question: q1, answerChoice: "London");
    Answer a2 = Answer(question: q2, answerChoice: "5");

    quiz.answers = [a1, a2];
    expect(quiz.getScoreInPercentage(), equals(0));
  });

  test('Fail (0%)', () {
    Answer a1 = Answer(question: q1, answerChoice: "London");
    Answer a2 = Answer(question: q2, answerChoice: "2");

    quiz.answers = [a1, a2];
    expect(quiz.getScoreInPercentage(), equals(0));
  });

}
