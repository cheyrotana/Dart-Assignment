import 'package:flutter/material.dart';
import 'hobby_card.dart';


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Hobbies',),
          backgroundColor: const Color.fromARGB(255, 240, 196, 211),
        ),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(title: 'Travelling', iconData: Icons.travel_explore, color: Colors.green,),
              HobbyCard(title: 'Skating', iconData: Icons.skateboarding, color: const Color.fromARGB(255, 99, 93, 93),)
            ],
          ),
        ),
      ),
    ),
  );
}
