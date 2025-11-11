import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum Position { left, right }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.iconData,
    ButtonType? buttonType,
    Position? iconPosition,
  }) : buttonType = buttonType ?? ButtonType.primary,
       iconPosition = iconPosition ?? Position.left;

  final String label;
  final IconData iconData;
  final Position iconPosition;
  final ButtonType buttonType;

  Color get backgroundColor {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.red;
      case ButtonType.secondary:
        return Colors.blue;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconLayout = iconPosition == Position.left
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(iconData), SizedBox(width: 8), Text(label)],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(label), SizedBox(width: 8), Icon(iconData)],
          );

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Center(
        child: ElevatedButton(
          onPressed: buttonType == ButtonType.disabled ? null : () {},
          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
          child: iconLayout,
        ),
      ),
    );
  }
}
