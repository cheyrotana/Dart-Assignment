import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(children: [GradientButton(text: 'HELLO 1'), GradientButton(text: 'HELLO 2'), GradientButton(text: 'HELLO3',)])
        ),
      ),
    ),
  );
}

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.text, Color? start, Color? end})
    : start = start ?? Colors.blue,
      end = end ?? Colors.blue;

  final String text;
  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [start, end],
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Text(text, style: TextStyle(fontSize: 35)),
    );
  }
}
