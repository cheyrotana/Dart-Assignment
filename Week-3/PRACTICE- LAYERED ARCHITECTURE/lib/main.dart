import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_file_provider.dart';

void main() {
  // List<Question> questions = [
  //   Question(
  //       title: "Capital of France?",
  //       choices: ["Paris", "London", "Rome"],
  //       goodChoice: "Paris",
  //       point: 50),
  //   Question(
  //       title: "2 + 2 = ?",
  //       choices: ["2", "4", "5"],
  //       goodChoice: "4",
  //       point: 50),
  // ];

  // Quiz quiz = Quiz(questions: questions);

  QuizRepository repository = QuizRepository('lib/data/quiz.json');
  Quiz quiz = repository.readQuiz();

  QuizConsole console = QuizConsole(quiz: quiz);
  console.startQuiz();
  repository.writeQuiz(quiz);
}
