import 'package:flutter/material.dart';
import 'package:flutterexercise/StatefulWidget/Week-9/ui/screen/question_screen.dart';
import './screen/start_screen.dart';
import './screen/history_screen.dart';
import '../model/answer_model.dart';

enum CurrentScreen { startScreen, questionScreen, historyScreen }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  CurrentScreen currentScreen = CurrentScreen.startScreen;
  List<Answer> attempts = [];

  void startQuiz(bool value) {
    setState(() {
      currentScreen = CurrentScreen.questionScreen;
      attempts.clear();
    });
  }

  void viewHistory(List<Answer> newAttempts) {
    setState(() {
      attempts = newAttempts;
      currentScreen = CurrentScreen.historyScreen;
    });
  }

  void backToStart() {
    setState(() {
      currentScreen = CurrentScreen.startScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;
    switch (currentScreen) {
      case CurrentScreen.startScreen:
        screen = StartScreen(onStartQuiz: startQuiz);
        break;
      case CurrentScreen.questionScreen:
        screen = QuestionScreen(onViewHistory: viewHistory);
        break;
      case CurrentScreen.historyScreen:
        screen = HistoryScreen(attempts: attempts, onBack: backToStart);
        break;
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff2196F3), Color(0xff0D47A1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
