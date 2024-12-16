import 'dart:convert';

import 'package:cleanly/pages/common%20/api_url.dart';
import 'package:cleanly/pages/common%20/pre_Utils.dart';
import 'package:cleanly/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class AccountVisibilityProvider with ChangeNotifier {
  bool _isVisible = false;
  String mobilenumber="";
  String token="";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool get isVisible => _isVisible;

  void setVisibility(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  // Custom initialization method
  Future<void> onInit() async {
    getdetails();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accesstoken').toString();
        mobilenumber=prefs.getString('phone').toString();
        print(">>>>>>phone>>>>>>>>>>$mobilenumber");
        phoneController.text=mobilenumber.toString();
        nameController.text=prefs.getString('name').toString();
         emailController.text=prefs.getString('email').toString();  
         print(">>>>.>.accounntonn...>>>>>>>>>$token");
    // Initialize visibility based on the token
    if (token != "null" && token.isNotEmpty) {
      setVisibility(false);
    
    } else {
       setVisibility(true);
   
    }
   getdetails();
    notifyListeners(); // Notify listeners to update the UI
  }

  onClicklogout(context) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
          setVisibility(true);
         
        prefs.clear();
            Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                     const LoginPage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(
                                    1.0, 0.0); // Start from the right side
                                const end = Offset.zero; // End at the center
                                const curve = Curves.easeInOut;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ));

  }
  Future<void> patchdetails(String url, Map<String, dynamic> body, context) async {
       SharedPreferences prefs = await SharedPreferences.getInstance();
    
    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
           'Authorization': 'Bearer ${prefs.getString("accesstoken")}'
        },
        body: jsonEncode(body),
      );
      print(">>>>>>>>${jsonEncode(body)}");
      print(">>>>>>>>$url");
      Map map = json.decode(response.body);
      if (response.statusCode == 200 ) {
         SharedPreferences prefs = await SharedPreferences.getInstance();
        print('Success: ${response.body}');
      
        print(
            ">>>>>>>>>>>>>>>>accesstaoken  ${prefs.getString('accesstoken').toString()}");
      
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
///////////////////////////////get edit profile//////////////////
  Future<void> getdetails() async {
       SharedPreferences prefs = await SharedPreferences.getInstance();
    
    try {
      final response = await http.get(
        Uri.parse(getupdateDetails),
        headers: {
          'Content-Type': 'application/json',
           'Authorization': 'Bearer ${prefs.getString("accesstoken")}'
        },
      );

      print(">>>>>>>>$getupdateDetails");
      Map map = json.decode(response.body);
      if (response.statusCode == 200 ) {
         SharedPreferences prefs = await SharedPreferences.getInstance();
        print('Success: ${response.body}');
         PrefUtils().savePreferencesData('name', map['name'].toString());
         PrefUtils().savePreferencesData('email', map['email'].toString());
           phoneController.text=mobilenumber.toString();
        nameController.text=prefs.getString('name').toString();
         emailController.text=prefs.getString('email').toString();
       
         print(
            ">>>>>>>>>>>>>>>>name  ${prefs.getString('name').toString()}");
            print(
            ">>>>>>>>>>>>>>>>email  ${prefs.getString('email').toString()}");
        print(
            ">>>>>>>>>>>>>>>>accesstaoken  ${prefs.getString('accesstoken').toString()}");
      
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
    @override
  void dispose() {
    // Clean up the controller when the provider is disposed.
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}

