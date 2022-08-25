import 'dart:convert';
import 'package:caffe/models/auth.dart';
import 'package:caffe/models/user.dart';
import 'package:flutter/foundation.dart';

import 'package:caffe/models/models.dart';
import 'package:caffe/utils/service/http/http.dart';
import 'package:caffe/utils/service/http/request_types.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<Product>> fetchProducts() async {
    final response = await _provider.makeRequest(
        RequestTypes.get, GetRequest.getProducts, RequestType.get);
    return compute(parseProducts, response.body);
  }

  Future<Auth> login(payload) async {
    final response = await _provider.makeRequest(
        RequestTypes.post, PostRequest.login, RequestType.post,
        payload: payload);
    return compute(parseAuth, response.body);
  }

  Future<Auth> register(payload) async {
    final response = await _provider.makeRequest(
        RequestTypes.post, PostRequest.register, RequestType.post,
        payload: payload);
    return compute(parseAuth, response.body);
  }

  Future<User> update(String email, payload, token) async {
    final response = await _provider.makeRequest(
        RequestTypes.patch, PatchRequest.updateUser(email), RequestType.patch,
        payload: payload, token: token);
    return compute(parseUser, response.body);
  }

  Future<User> fetchUser(String email, String token) async {
    final response = await _provider.makeRequest(
        RequestTypes.get, GetRequest.getUser(email), RequestType.get,
        token: token);
    return compute(parseUser, response.body);
  }
}

List<Product> parseProducts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

Auth parseAuth(String responseBody) {
  try {
    final parsed = jsonDecode(responseBody);
    return Auth.fromJson(parsed);
  } catch (e) {
    final badRequest = jsonDecode(responseBody);
    throw Exception(badRequest['message']);
  }
}

User parseUser(String responseBody) {
  final parsed = jsonDecode(responseBody);

  return User.fromJson(parsed);
}
