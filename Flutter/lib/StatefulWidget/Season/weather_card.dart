import 'package:flutter/material.dart';

enum Season {
  summer('assets/weather/summer.jpg'),
  winter('assets/weather/winter.jpg'),
  spring('assets/weather/spring.jpg'),
  fall('assets/weather/fall.jpg');

  final String imagePath;
  const Season(this.imagePath);
}

class SeasonCard extends StatefulWidget {
  const SeasonCard({
    super.key,
    required this.initialSeason,
    required this.country,
  });

  final Season initialSeason;
  final String country;

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  late Season currentSeason;

  @override
  void initState() {
    super.initState();
    currentSeason = widget.initialSeason;
  }

  void onPressed() {
    setState(() {
      switch (currentSeason) {
        case Season.winter:
          currentSeason = Season.spring;
          break;
        case Season.spring:
          currentSeason = Season.summer;
          break;
        case Season.summer:
          currentSeason = Season.fall;
          break;
        case Season.fall:
          currentSeason = Season.winter;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            GestureDetector(
              onTap: onPressed,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  currentSeason.imagePath,
                  height: 550,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                widget.country,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
