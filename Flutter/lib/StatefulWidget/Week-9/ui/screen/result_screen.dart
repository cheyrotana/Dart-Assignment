import 'package:flutter/material.dart';
import '../../model/answer_model.dart';
import '../reusable_widget/navigation_button.dart';

class ResultScreen extends StatelessWidget {
  final List<Answer> attempts;
  final VoidCallback onRestart;
  final VoidCallback onViewHistory;
  const ResultScreen({
    super.key,
    required this.attempts,
    required this.onRestart,
    required this.onViewHistory,
  });

  @override
  Widget build(BuildContext context) {
    final correct = attempts.where((a) => a.isCorrect()).length;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          const SizedBox(height: 32),
          Text(
            'Your Score',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            '$correct / ${attempts.length}',
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.builder(
              itemCount: attempts.length,
              itemBuilder: (context, index) {
                final attempt = attempts[index];
                final isCorrect = attempt.isCorrect();
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          isCorrect ? Icons.check_circle : Icons.cancel,
                          color: isCorrect ? Colors.green : Colors.red,
                          size: 32,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                attempt.question.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Your answer: ${attempt.answerChoice}',
                                style: TextStyle(
                                  color: isCorrect ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                isCorrect ? 'Correct' : 'Wrong',
                                style: TextStyle(
                                  color: isCorrect ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavigationButton(text: 'Restart', onPressed: onRestart),
                const SizedBox(height: 16),
                NavigationButton(
                  text: 'View History',
                  onPressed: onViewHistory,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
