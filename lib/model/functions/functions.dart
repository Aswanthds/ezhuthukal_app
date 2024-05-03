import 'dart:convert';

import 'package:ezhuthukal_app/model/core/api.dart';
import 'package:ezhuthukal_app/model/functions/storage.dart';
import 'package:http/http.dart' as http;

var client = http.Client();
Future<void> createNoteOnServerInBackground() {
  final response = http.post(
    Uri.parse(
        'http://127.0.0.1:8000/api/users/register/'), // Replace with your API endpoint
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "first_name": "phone-app",
      "last_name": "noteText",
      "email": "aswanth@gmail.com",
      "password": "longitude",
      "profile_pic": '',
      "is_staff": false,
    }),
  );

  return response.then((response) {
    if (response.statusCode == 201) {
      // If the API call is successful, return here
      return;
    } else {
      // If the API call fails, throw an exception to be caught by the catchError block
      throw Exception(
          'Failed to create note. Status code: ${response.statusCode}');
    }
  }).catchError((e) {
    // If any error occurs during the API call, throw an exception to be caught by the catchError block
    throw Exception('Error creating note: $e');
  });
}

Future<Map<String, dynamic>> gettoken(String email, String password) async {
  //http://127.0.0.1:8000/api/token/

  final response = await http.post(
    Uri.parse(token), // Replace with your API endpoint
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "email": email,
      "password": password,
    }),
  );
  if (response.statusCode == 201 || response.statusCode == 200) {
    print(response.body);
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    var data = await StorageFunctions.getAccessToken();
    if (data != null) {
     print(verifyAccessToken(data));

    }
  }
  print(response.statusCode);
  return {};
}

Future<bool> verifyAccessToken(String accessToken) async {
  final response = await http.post(
    Uri.parse("http://127.0.0.1:8000/api/token/verify/"),
   headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "token": accessToken
    }),
  );

  if (response.statusCode == 200) {
    final decodedResponse = jsonDecode(response.body) as Map<String,dynamic>;
    // Check for a "valid" field or similar in the response
    // (modify based on your API's response structure)
    return decodedResponse.isEmpty; // Handle potential missing key
  } else {
    // Handle error cases (e.g., invalid token, server errors)
    print('Error verifying access token: ${response.statusCode}');
    return false;
  }
}


Future<Map<String, dynamic>> getUser(String token) async {
  try {
    final response = await http.get(
      Uri.parse(currentUser), // Replace with your API endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      print(data);
      return data;
    }
    return {};
  } catch (e) {
    print(e);
    return {};
  }
}
