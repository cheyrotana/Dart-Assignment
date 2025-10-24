import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_file_provider.dart';

void main() {
  QuizRepository repository = QuizRepository('lib/data/quiz.json');
  Quiz quiz = repository.readQuiz();

  QuizConsole console = QuizConsole(quiz: quiz);
  console.startQuiz();
  repository.writeQuiz(quiz);
}
