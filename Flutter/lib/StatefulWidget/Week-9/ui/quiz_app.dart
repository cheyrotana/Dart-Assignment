import 'package:flutter/material.dart';
import './screen/start_screen.dart';

enum CurrentScreen { startScreen, questionScreen, historyScreen }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  CurrentScreen currentScreen = CurrentScreen.startScreen;
  bool isQuizStarted = false;

  void onClickedStartQuiz(bool newValue) {
    setState(() {
      isQuizStarted = newValue;
    });
  }

  int get currentScreenIndex {
    if (isQuizStarted) {
      return CurrentScreen.questionScreen.index;
    } else {
      return CurrentScreen.startScreen.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          child: currentScreenIndex == CurrentScreen.startScreen.index
              ? StartScreen(
                  onStartQuiz: onClickedStartQuiz,
                )
              : const Placeholder(),
        )
      ),
    );
  }
}