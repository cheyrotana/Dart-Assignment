import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [ScoreCard(title: 'dog')]),
        ),
      ),
    ),
  );
}

class ScoreCard extends StatefulWidget {
  const ScoreCard({super.key, required this.title});

  final String title;

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {


  void onAdd() {
    setState(() {
      
    });
  }

  void onRemove() {
    setState(() {
      
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'My Score in Flutter',
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
              IconButton(onPressed: onAdd, icon: Icon(Icons.remove)),
              SizedBox(width: 100),
              IconButton(onPressed: onRemove, icon: Icon(Icons.add)),
            ],
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(18),
                width: double.infinity,
                height: 40,
                decoration: (BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                )),
              ),
              Positioned(
                left: 19,
                top: 19,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 100,
                    height: 38,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
