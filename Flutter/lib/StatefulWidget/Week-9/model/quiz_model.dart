import 'question_model.dart';
import 'answer_model.dart';

class Quiz {
  final List<Question> questions;
  final List<Answer> answers;

  Quiz({required this.questions, required this.answers});

  int getScore() {
    return answers.where((answer) => answer.isCorrect()).length;
  }
}
