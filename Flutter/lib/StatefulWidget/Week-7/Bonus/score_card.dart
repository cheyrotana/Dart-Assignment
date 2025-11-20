import 'package:flutter/material.dart';
class ScoreCard extends StatefulWidget {
  const ScoreCard({super.key, required this.title});

  final String title;

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  double width = 0.0;

  void onAdd() {
    setState(() {
      width = (width + 0.1).clamp(0.0, 1.0);
    });
  }

  void onRemove() {
    setState(() {
      width = (width - 0.1).clamp(0.0, 1.0);
    });
  }

  Color get progressColor {
    if (width <= 0.4) {
      return const Color.fromARGB(255, 97, 211, 101);
    } else if (width > 0.4 && width <= 0.75) {
      return const Color.fromARGB(255, 78, 187, 83);
    } else {
      return const Color.fromARGB(255, 47, 128, 53);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),
              SizedBox(width: 100),
              IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
            ],
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                decoration: (BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                )),
              ),
              FractionallySizedBox(
                widthFactor: width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(height: 40, color: progressColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
