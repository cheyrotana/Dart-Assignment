import 'package:flutter/material.dart';
import '../reusable_widget/button.dart';
import '../../data/question.dart';
import '../../model/answer_model.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(List<Answer>) onViewHistory;
  const QuestionScreen({super.key, required this.onViewHistory});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;
  bool finished = false;
  List<Answer> attempts = [];

  void _onAnswerSelected(String choice) {
    final question = sampleQuestions[currentIndex];
    attempts.add(Answer(question: question, answerChoice: choice));
    if (currentIndex < sampleQuestions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      setState(() {
        finished = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (finished) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                  finished = false;
                  attempts.clear();
                });
              },
              child: const Text('Restart'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => widget.onViewHistory(attempts),
              child: const Text('View History'),
            ),
          ],
        ),
      );
    }

    final question = sampleQuestions[currentIndex];
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Question ${currentIndex + 1} of ${sampleQuestions.length}',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            question.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ...question.choices.map(
            (choice) => AnswerButton(
              text: choice,
              onPressed: () => _onAnswerSelected(choice),
            ),
          ),
        ],
      ),
    );
  }
}
