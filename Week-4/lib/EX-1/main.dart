import 'package:flutter/material.dart'; 

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 179, 198),
        body: Center(
          child: Text(
            'Hello my name is Ronan!',
            style: TextStyle(fontSize: 50, color: Colors.orange),
          ),
        ),
      ),
    ),
  );
}
