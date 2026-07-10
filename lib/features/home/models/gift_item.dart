import 'package:flutter/material.dart';

class GiftItem {
  const GiftItem({
    required this.name,
    required this.pack,
    required this.price,
    required this.image,
    required this.stackColors,
  });

  final String name;
  final String pack;
  final String price;
  final String image;
  final List<Color> stackColors;
}
