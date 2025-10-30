import 'package:flutter/material.dart';
import 'gradient_button.dart';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(children:
          [ 
              GradientButton(
                text: 'HELLO 1',
                start: Color(0xFF4E7DF5),
                end: Color(0xFF0335B6),
              ), 
              GradientButton(
                text: 'HELLO 2',
                start: Color(0xFF4E7DF5),
                end: Color(0xFF0335B6),
              ), 
              GradientButton(
                text: 'HELLO 3',
                start: Color(0xFF4E7DF5),
                end: Color(0xFF0335B6),
              ), 
          ]),
        ),
      ),
    ),
  );
}
