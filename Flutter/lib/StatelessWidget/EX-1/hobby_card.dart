import 'package:flutter/material.dart';

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
              child: Icon(iconData, color: Colors.white),
            ),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
