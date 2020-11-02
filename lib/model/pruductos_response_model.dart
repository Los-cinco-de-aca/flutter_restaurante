import 'package:flutter_http_post_request/model/pruductos_response_data.dart';

class ProductosResponseModel {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;
  final List<ProductosResponseData> data;

  ProductosResponseModel(
      {this.page, this.per_page, this.total, this.total_pages, this.data});

  factory ProductosResponseModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<ProductosResponseData> imagesList =
        list.map((i) => ProductosResponseData.fromJson(i)).toList();

    return ProductosResponseModel(
      page: json['page'] ?? '',
      per_page: json['per_page'] ?? '',
      total: json['total'] ?? '',
      total_pages: json['total_pages'] ?? '',
      data: imagesList ?? '',
    );
  }
}
