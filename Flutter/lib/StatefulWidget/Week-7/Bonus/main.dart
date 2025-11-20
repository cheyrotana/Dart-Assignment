import 'package:flutter/material.dart';
import 'score_card.dart';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: 
            [
              ScoreCard(title: 'My score in flutter'),
              ScoreCard(title: 'My score in dart'),
              ScoreCard(title: 'My score in java'),
            ]
          ),
        ),
      ),
    ),
  );
}
