class GetRequest {
  static const getProducts = 'products';
  static String getUser(String email) => 'user/$email';
}

class PostRequest {
  static const login = 'auth/login';
  static const register = 'auth/register';
}

class PatchRequest {
  static String updateUser(String email) => 'user/$email';
}

class DelteRequest {}

class RequestTypes {
  static const String get = 'get';
  static const String post = 'post';
  static const String patch = 'patch';
  static const String delete = 'delete';
}

enum RequestType { get, post, patch }
