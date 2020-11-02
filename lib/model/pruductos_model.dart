import 'package:flutter/material.dart';

class ProductosModel {
  final String name;
  final String image;
  final String color;
  final int price;
  final int quantity;

  void set name(String name) {
    this.name = name;
  }

  void set image(String image) {
    this.image = image;
  }

  void set color(String color) {
    this.color = color;
  }

  void set price(int price) {
    this.price = price;
  }

  void set quantity(int quantity) {
    this.quantity = quantity;
  }

  ProductosModel(
      {this.name, this.image, this.color, this.price = 1, this.quantity});
}
