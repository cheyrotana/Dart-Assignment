// ignore_for_file: file_names
import 'package:flutter/material.dart';
import './screen/question_screen.dart';
import './screen/start_screen.dart';
import './screen/history_screen.dart';
import './screen/result_screen.dart';
import '../model/answer_model.dart';
import '../model/question_model.dart';

enum CurrentScreen { startScreen, questionScreen, resultScreen, historyScreen }

class QuizApp extends StatefulWidget {
  final List<Question> quizData;

  const QuizApp({super.key, required this.quizData});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  CurrentScreen currentScreen = CurrentScreen.startScreen;
  List<Answer> attempts = [];
  List<List<Answer>> allAttempts = [];

  void startQuiz() {
    setState(() {
      currentScreen = CurrentScreen.questionScreen;
      attempts.clear();
    });
  }

  void viewHistory(List<Answer> newAttempts) {
    if (newAttempts.isNotEmpty) {
      allAttempts.add(List<Answer>.from(newAttempts));
    }
    setState(() {
      currentScreen = CurrentScreen.historyScreen;
    });
  }

  void showResult(List<Answer> newAttempts) {
    setState(() {
      attempts = newAttempts;
      currentScreen = CurrentScreen.resultScreen;
    });
  }

  void backToStart() {
    setState(() {
      currentScreen = CurrentScreen.startScreen;
    });
  }

  Widget get currentScreenWidget {
    switch (currentScreen) {
      case CurrentScreen.startScreen:
        return StartScreen(onStartQuiz: startQuiz);

      case CurrentScreen.questionScreen:
        return QuestionScreen(
          onQuizFinished: showResult,
          quizData: widget.quizData,
        );

      case CurrentScreen.resultScreen:
        return ResultScreen(
          attempts: attempts,
          onRestart: backToStart,
          onViewHistory: () => viewHistory(attempts),
        );

      case CurrentScreen.historyScreen:
        return HistoryScreen(allAttempts: allAttempts, onRestart: backToStart);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.lightBlueAccent),
          child: currentScreenWidget,
        ),
      ),
    );
  }
}
