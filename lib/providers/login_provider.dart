import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  bool _isVisible = false;
  String phoneNumber = '';

  bool get isVisible => _isVisible;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void setVisibility(bool visibility) {
    _isVisible = visibility;
    notifyListeners();
  }

  Future<void> postData(String url, Map<String, dynamic> body, context) async {
    print(">>>>api>>>>$body}");
    http.Client client = http.Client();
    final String encodedData = json.encode(body);

    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: encodedData,
      );
      print(">>>>api>>>>${jsonEncode(body)}");
      print(">>>>>>>>$url");
      if (response.statusCode == 200) {
        // Handle successful response
        print('Success: ${response.body}');
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        throw Exception('Failed to post data');
      }
    } catch (e) {
      // Handle network or other errors
      print('Exception: $e');
      throw e;
    }
  }
}
