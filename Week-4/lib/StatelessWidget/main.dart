import 'package:flutter/material.dart';

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

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    super.key,
    required this.title,
    required this.iconData,
    Color? color,
  }) : color = color ?? Colors.blue;

  final String title;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20, left: 30),
              child: Icon(iconData , color: Colors.white),
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
