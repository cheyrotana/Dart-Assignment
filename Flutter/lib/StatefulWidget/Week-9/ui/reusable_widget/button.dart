import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: null,
        child: Text('Reusable Button'),
      ),
    );
  }
}