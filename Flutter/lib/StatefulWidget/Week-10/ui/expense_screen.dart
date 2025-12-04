import 'package:flutter/material.dart';
import 'expense_card.dart';
import '../data/expense.dart';
import 'text_field.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ronan-The-Best Expenses App'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextField(),
                          ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Close Modal'),)
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.lightBlue[100],
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: ExpenseData.length,
          itemBuilder: (context, index) {
            return ExpenseCard(expense: ExpenseData[index]);
          },
        ),
      ),
    );
  }
}
