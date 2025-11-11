import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String cityName;
  final String minTemp;
  final String maxTemp;
  final String currentTemp;
  final String imagePath;
  final List<Color> gradientColors;

  const WeatherCard({
    super.key,
    required this.cityName,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.imagePath,
    List<Color>? gradientColors,
  }) : gradientColors =
           gradientColors ?? const [Color(0xFFBA68C8), Color(0xFF8E24AA)];

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 3,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -30,
              right: -10,
              child: Container(
                width: 170,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(imagePath),
                        radius: 28,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cityName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Min $minTemp °C',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Max $maxTemp °C',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '$currentTemp°C',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
