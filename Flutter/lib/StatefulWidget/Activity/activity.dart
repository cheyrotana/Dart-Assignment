import 'package:flutter/material.dart';

void main() {

  void onPress(){
    // ignore: avoid_print
    print("hello");
  }
  runApp(
    MaterialApp(
      title: 'My app',
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onPress,
            child: const Text(
              "Press me",
              style: TextStyle(fontSize: 50),
            ),
          )
        ],
      ),
    ),
  );
}