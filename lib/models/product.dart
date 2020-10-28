import 'package:flutter/material.dart';

class Product {
  final String imageUrl, title, subtitle, description;
  final int price, id;
  final Color color;
  final bool isRecomended, isBestSeller;
  final List<int> subcategories;

  Product({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.subtitle,
    @required this.price,
    @required this.description,
    @required this.color,
    @required this.subcategories,
    this.isRecomended = false,
    this.isBestSeller = false,
  });
}