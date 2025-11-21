import 'package:flutter/material.dart';
import 'package:flutterexercise/StatefulWidget/Week-8/EXERCISE-2/ui/screens/temperature_screen.dart';

import 'ui/screens/welcome_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isActive = false;

  void onPressWelcome() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isActive ? TemperatureScreen() : WelcomeScreen(onChanged: (value) => onPressWelcome(),),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp() );
}
