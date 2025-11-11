import 'package:flutter/material.dart';
import 'product_card.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(title: Text('Products')),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductCard(type: Product.dart),
              ProductCard(type: Product.flutter),
              ProductCard(type: Product.firebase),
            ],
          ),
        ),
      ),
    ),
  );
}


