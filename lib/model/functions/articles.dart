import 'dart:convert';

import 'package:ezhuthukal_app/model/core/api.dart';
import 'package:ezhuthukal_app/model/functions/storage.dart';
import 'package:http/http.dart' as http;

class ArticleFunctions {
  static Future<List<dynamic>> getAllArticles() async {
    try {
      final response = await http.get(
        Uri.parse(articleList), // Replace with your API endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body)['Articles'] as List<dynamic>;
        return data;
      }
      print(response.statusCode);
      return [];
    } catch (e) {
      print("Error$e");
      return [];
    }
  }
}
