import 'package:flutter/material.dart';
import '../../model/answer_model.dart';

class HistoryScreen extends StatelessWidget {
  final List<Answer> attempts;
  final VoidCallback onBack;
  const HistoryScreen({
    super.key,
    required this.attempts,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: attempts.isEmpty
          ? const Center(child: Text('No attempts yet.'))
          : ListView.builder(
              itemCount: attempts.length,
              itemBuilder: (context, index) {
                final attempt = attempts[index];
                final isCorrect = attempt.isCorrect();
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(attempt.question.title),
                    subtitle: Text(
                      'Your answer: ${attempt.answerChoice} (${isCorrect ? 'Correct' : 'Wrong'})',
                    ),
                    leading: Icon(
                      isCorrect ? Icons.check_circle : Icons.cancel,
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
