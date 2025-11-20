import 'package:flutter/material.dart';
import 'weather_card.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Center(
          child: Container(
            width: 1000,
            height: 800,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 8),
                Text(
                  'SEASONS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SeasonCard(
                      initialSeason: Season.winter,
                      country: 'FRANCE',
                    ),
                    SeasonCard(
                      initialSeason: Season.summer,
                      country: 'CAMBODIA',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
