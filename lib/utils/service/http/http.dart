import 'package:http/http.dart' as http;

import 'package:caffe/constants/api_path.dart';

class ApiProvider {
  Future<http.Response> makeRequest(
    String request,
    String url,
  ) async {
    final uri = Uri.http(apiPath, 'products');
    final response = await http.get(uri);
    return response;
  }
}
