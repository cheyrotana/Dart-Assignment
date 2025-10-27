import 'package:flutter/material.dart';

void main() {

  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              NewWidget(),
              NewWidget(),
              NewWidget(),
            ],
          ),
        ),
      ),
    ),
  );
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4E7DF5),
            Color(0xFF0335B6),
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: Text(
        'HELLO 1',
        style: TextStyle(fontSize: 35),
      ),
    );
  }
}