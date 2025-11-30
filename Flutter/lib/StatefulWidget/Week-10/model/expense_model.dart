import 'package:flutter/widgets.dart';

class Expense {
  String title;
  double price;
  IconData icon;
  DateTime date;

  Expense({
    required this.title,
    required this.price,
    required this.icon,
    DateTime? date,
  }) : date = date ?? DateTime.now();
}
