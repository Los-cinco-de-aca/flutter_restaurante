import 'package:flutter_http_post_request/model/pruductos_response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';
import '../model/registre_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    var url = 'https://reqres.in/api/login';

    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<RegistreResponsModel> registre(
      RegistreRequestModel requestModel) async {
    var url2 = 'https://reqres.in/api/register';

    final response2 = await http.post(url2, body: requestModel.toJson());
    if (response2.statusCode == 200 || response2.statusCode == 400) {
      return RegistreResponsModel.fromJson(
        json.decode(response2.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<ProductosResponseModel> getProducts() async {
    var url2 = 'https://reqres.in/api/unknown';

    final response2 = await http.get(url2);

    if (response2.statusCode == 200 || response2.statusCode == 400) {
      return ProductosResponseModel.fromJson(
        json.decode(response2.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
