import 'dart:convert';
import 'package:cleanly/pages/common%20/pre_Utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OtpProvider with ChangeNotifier {
  final String phoneNumber;
  String otp = '';

  OtpProvider(this.phoneNumber);
  bool _isVisible = false;
  bool _isVisible1 = false;

  bool get isVisible => _isVisible;
  bool get isVisible1 => _isVisible1;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void setVisibility(bool visibility) {
    _isVisible = visibility;
    notifyListeners();
  }

  Future<void> postOtp(String url, Map<String, dynamic> body, context) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      print(">>>>>>>>${jsonEncode(body)}");
      print(">>>>>>>>$url");
      Map map = json.decode(response.body);
      if (response.statusCode == 200) {
         SharedPreferences prefs = await SharedPreferences.getInstance();
        print('Success: ${response.body}');
       
        print(">>>>>>>>>>>>>>>>name  $map");
        PrefUtils().savePreferencesData(
            'accesstoken', map['tokens']['access_token'].toString());
        PrefUtils().savePreferencesData('name', map['name'].toString());
        PrefUtils().savePreferencesData('phone', map['phone'].toString());
        print(
            ">>>>>>>>>>>>>>>>accesstaoken  ${map['tokens']['access_token'].toString()}");
        print(
            ">>>>>>>>>>>>>>>>accesstaoken  ${prefs.getString('accesstoken').toString()}");
        print(">>>>>>>>>>>>>>>>phone  ${prefs.getString('phone').toString()}");
        notifyListeners();
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
          notifyListeners();
        throw Exception('Failed to post data');
       
      }
        notifyListeners();
    } catch (e) {
      // Handle network or other errors
      print('Exception: $e');
       notifyListeners();
      throw e;
    }
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
