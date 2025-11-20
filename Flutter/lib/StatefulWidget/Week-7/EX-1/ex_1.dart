import 'package:flutter/material.dart';
import 'select_button.dart';
void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: SizedBox(
          width: 400, height: 200, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelectButton(),
              SelectButton(),
              SelectButton(),
            ],
          )
        ),
      ),
    ),
  ),
);
