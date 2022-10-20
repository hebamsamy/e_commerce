import 'package:flutter/material.dart';

class Product {
  String id;
  String name;
  String img;
  int quantity;
  int price;
  Product(
      {required this.id,
      required this.name,
      required this.img,
      required this.price,
      required this.quantity});
}
