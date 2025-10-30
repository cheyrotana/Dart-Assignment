import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      color: Colors.blue[300],
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[600]
        ),
        child: Center(
          child: Text('CADT STUDENTS', style: TextStyle(fontSize: 30)),
        )
      ),
    ),
  ));
}
