import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const NavigationButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(text, style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
