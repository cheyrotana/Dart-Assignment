import 'package:flutter/material.dart';
import '../../model/answer_model.dart';
import '../reusable_widget/navigation_button.dart';

class HistoryScreen extends StatelessWidget {
  final List<List<Answer>> allAttempts;
  final VoidCallback onRestart;
  const HistoryScreen({
    super.key,
    required this.allAttempts,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: allAttempts.isEmpty
                ? const Center(child: Text('No attempts yet.'))
                : ListView.builder(
                    itemCount: allAttempts.length,
                    itemBuilder: (context, index) {
                      final attemptList = allAttempts[index];
                      final correct = attemptList
                          .where((a) => a.isCorrect())
                          .length;
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Attempt ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Score: $correct / ${attemptList.length}',
                                style: const TextStyle(fontSize: 15),
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
            child: NavigationButton(text: 'Restart', onPressed: onRestart),
          ),
        ],
      ),
    );
  }
}
