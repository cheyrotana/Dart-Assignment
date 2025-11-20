import "package:/flutter/material.dart";

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool isSelected = false;

  Color get backgroundColor =>
      isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  String get text => isSelected ? 'Selected' : 'Not Selected';

  Color get textColor => isSelected ? Colors.white : Colors.black;

  void onSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      onPressed: onSelected,
      child: Center(
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
