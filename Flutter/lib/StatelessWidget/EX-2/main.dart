import 'package:flutter/material.dart';
import 'custom_button.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom buttons')),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomButton(
                label: 'Submit',
                iconData: Icons.check,
                iconPosition: Position.left,
                buttonType: ButtonType.primary,
              ),
              CustomButton(
                label: 'Time',
                iconData: Icons.punch_clock,
                iconPosition: Position.right,
                buttonType: ButtonType.secondary,          
              ),
              CustomButton(
                label: 'Account',
                iconData: Icons.account_balance,
                iconPosition: Position.right,
                buttonType: ButtonType.disabled,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
