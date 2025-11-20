import 'package:flutter/material.dart';
import 'favorite_card.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavoriteCard(
            isFavorite: false,
            title: 'Card 1',
            description: 'This is the first card.',
          ),
          FavoriteCard(
            isFavorite: true,
            title: 'Card 2',
            description: 'This is the second card.',
          ),
          FavoriteCard(
            isFavorite: false,
            title: 'Card 3',
            description: 'This is the third card.',
          ),
        ],
      ),
    ),
  ),
);
