import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'package:caffe/constants/api_path.dart';
import 'package:caffe/utils/service/http/request_types.dart';

class ApiProvider {
  Future<http.Response> makeRequest(
      String request, String url, RequestType requestType,
      {dynamic payload}) async {
    final uri = Uri.http(apiPath, url);
    final response =
        await SelectRequest(requestType).request(uri, payload: payload);
    return response;
  }
}

extension SelectRequest on RequestType {
  String get name => describeEnum(this);

  Future<http.Response> request(uri, {payload}) async {
    switch (this) {
      case RequestType.get:
        final response = await http.get(uri);
        return response;
      case RequestType.post:
        final response = await http.post(uri, body: payload);
        return response;
    }
  }
}
