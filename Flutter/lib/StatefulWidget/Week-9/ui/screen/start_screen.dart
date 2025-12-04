import 'package:flutter/material.dart';
import '../reusable_widget/navigation_button.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onStartQuiz;

  const StartScreen({super.key, required this.onStartQuiz});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Quiz App',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          NavigationButton(text: 'Start Quiz', onPressed: onStartQuiz),
        ],
      ),
    );
  }
}
