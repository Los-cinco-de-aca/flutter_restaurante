import 'package:flutter/material.dart';

class ProductosResponseData {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantone_value;

  ProductosResponseData(
      {this.id, this.name, this.year, this.color, this.pantone_value});

  factory ProductosResponseData.fromJson(Map<String, dynamic> json) {
    return ProductosResponseData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      year: json['year'] ?? '',
      color: json['color'] ?? '',
      pantone_value: json['pantone_value'] ?? '',
    );
  }
}
