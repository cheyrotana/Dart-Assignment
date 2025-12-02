import 'package:flutter/material.dart';
// import '../reusable_widget/button.dart';
class StartScreen extends StatelessWidget {
  final ValueChanged<bool> onStartQuiz;

  const StartScreen({super.key, required this.onStartQuiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quiz Dart',
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                onPressed: () {
                  onStartQuiz(true);
                }, child: Text('Start Quiz')
              )
            ],
          ),
        ),
      ),
    );
  }
}