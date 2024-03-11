import 'package:flutter/material.dart';

class Gem{
  final String imagePath;
  final String name;
  final String price;
  final String type;
   bool isFavourite;
  Gem({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.type,
    this.isFavourite = false});
}

