import 'package:flutter/material.dart';

enum Product {
  dart(
    title: "Dart",
    description: "The best object language.",
    image: "assets/ex3/dart.png",
  ),
  flutter(
    title: "Flutter",
    description: "The best mobile widget library",
    image: "assets/ex3/flutter.png",
  ),
  firebase(
    title: "Firebase",
    description: "The best cloud database",
    image: "assets/ex3/firebase.png",
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.type});

  final Product type;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(type.image, width: 80),
            const SizedBox(height: 8),
            Text(
              type.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(type.description, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
