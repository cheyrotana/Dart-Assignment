import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(50),
          margin: EdgeInsets.all(40),
          color: Colors.blue[300],
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Center(
              child: Text(
                'CADT STUDENTS',
                style: TextStyle(
                  color: Colors.white)
                ),
              ),
            ),
          ),
        ),
      )
    );
}
