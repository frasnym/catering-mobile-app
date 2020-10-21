import 'package:flutter/material.dart';

class Product {
  final String imageUrl, title, description;
  final int price, id;
  final Color color;

  Product({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.color,
  });
}

List<Product> products = [
  Product(
    id: 1,
    imageUrl: 'https://i.ibb.co/YchcSRN/1-chicken-salad.png',
    title: 'Chicken Salad',
    price: 30000,
    description: 'Oishi Chicken Salad',
    color: Color(0XFFE3D4B7),
  ),
  Product(
    id: 2,
    imageUrl: 'https://i.ibb.co/yhvhsLD/2-cap-cay.png',
    title: 'Cap Cay',
    price: 50000,
    description: 'Oishi Cap Cay',
    color: Color(0XFF7E4327),
  )
];
