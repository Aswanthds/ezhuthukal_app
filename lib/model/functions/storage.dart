import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageFunctions {
  static const storage = FlutterSecureStorage();
  static Future<void> securelyStoreToken(
      String accessToken, String refreshToken) async {
    try {
      await storage.write(key: 'access', value: accessToken);
      await storage.write(key: 'refresh', value: refreshToken);

      debugPrint('Access token stored successfully!');
    } catch (e) {
      debugPrint('Error storing access token: $e');
    }
  }

  static Future<String?> getAccessToken() async {
    try {
      final token = await storage.read(key: 'access');
      return token;
    } catch (e) {
      debugPrint('Error reading access token: $e');
      return null; // Or handle the error differently (e.g., return a default value)
    }
  }
   static Future<String?> getRefreshToken() async {
    try {
      final token = await storage.read(key: 'refresh');
      return token;
    } catch (e) {
      debugPrint('Error reading refresh token: $e');
      return null; // Or handle the error differently (e.g., return a default value)
    }
  }
}
