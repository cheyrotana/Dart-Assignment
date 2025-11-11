import 'package:flutter/material.dart';
import 'weather_card.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              WeatherCard(
                cityName: 'PhnomPenh',
                minTemp: '10.0',
                maxTemp: '30.0',
                currentTemp: '12.2',
                imagePath: 'assets/ex4/cloudy.png',
                gradientColors: [
                  Colors.purple.shade300,
                  Colors.purple.shade500,
                ],
              ),
              SizedBox(height: 16),
              WeatherCard(
                cityName: 'Paris',
                minTemp: '10.0',
                maxTemp: '40.0',
                currentTemp: '22.2',
                imagePath: 'assets/ex4/sunnyCloudy.png',
                gradientColors: [Colors.teal.shade200, Colors.teal.shade400],
              ),
              SizedBox(height: 16),
              WeatherCard(
                cityName: 'Rome',
                minTemp: '10.0',
                maxTemp: '40.0',
                currentTemp: '45.2',
                imagePath: 'assets/ex4/sunny.png',
                gradientColors: [Colors.pink.shade300, Colors.pink.shade500],
              ),
              SizedBox(height: 16),
              WeatherCard(
                cityName: 'Toulouse',
                minTemp: '10.0',
                maxTemp: '40.0',
                currentTemp: '45.2',
                imagePath: 'assets/ex4/veryCloudy.png',
                gradientColors: [Colors.orange.shade200, Colors.orange.shade400],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
