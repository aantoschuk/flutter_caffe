import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static late FlutterSecureStorage storage;

  static void init() {
    storage = const FlutterSecureStorage();
  }

  static void saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() async {
    final token = await storage.read(key: 'token');
    return token;
  }

  static void removeToken() async {
    await storage.delete(key: 'token');
  }
}
