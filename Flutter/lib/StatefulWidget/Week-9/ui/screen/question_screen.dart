import 'package:flutter/material.dart';
import '../reusable_widget/custom_button.dart';
import '../../model/answer_model.dart';
import '../../model/question_model.dart';

class QuestionScreen extends StatefulWidget {

  // Callback so parent (QuizApp) can show result once answers are ready
  final void Function(List<Answer>) onQuizFinished;
  final List<Question> quizData;

  const QuestionScreen({
    super.key,
    required this.onQuizFinished,
    required this.quizData,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;
  List<Answer> attempts = [];

  void onAnswerSelected(String choice) {

    final question = widget.quizData[currentIndex];
    attempts.add(Answer(question: question, answerChoice: choice));
    if (currentIndex < widget.quizData.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      widget.onQuizFinished(attempts);
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quizData[currentIndex];
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Question ${currentIndex + 1} of ${widget.quizData.length}',
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(
            question.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ...question.choices.map(
            (choice) => CustomButton(
              text: choice,
              onPressed: () => onAnswerSelected(choice),
            ),
          ),
        ],
      ),
    );
  }
}
