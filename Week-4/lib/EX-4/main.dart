import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomCard(text: 'OOP'),
              CustomCard(text: 'DART'),
              CustomCard(
                text: 'FLUTTER',
                start: Colors.blue[300],
                end: Colors.blue[600],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.text, Color? start, Color? end})
    : start = start ?? Colors.blue,
      end = end ?? Colors.blue;

  final String text;
  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [start, end]),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
