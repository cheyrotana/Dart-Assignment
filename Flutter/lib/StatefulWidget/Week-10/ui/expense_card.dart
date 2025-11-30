import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/expense_model.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  '\$ ${expense.price.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(expense.icon, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  DateFormat('MM/dd/yyyy').format(expense.date),
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
