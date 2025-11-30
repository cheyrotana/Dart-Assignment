import 'package:flutter/material.dart';
import './ui/expense_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpenseScreen(),
    ),
  );
}