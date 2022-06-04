import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:caffe/models/models.dart';
import 'package:caffe/utils/service/http/http.dart';
import 'package:caffe/utils/service/http/request_types.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<Product>> fetchProducts() async {
    final response =
        await _provider.makeRequest(RequestTypes.get, GetRequest.getProducts);

    return compute(parseProducts, response.body);
  }
}

List<Product> parseProducts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}
