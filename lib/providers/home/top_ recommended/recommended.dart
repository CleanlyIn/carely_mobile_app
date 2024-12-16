import 'dart:convert';
import 'package:cleanly/pages/common%20/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:cleanly/pages/model/top_remmonended.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopRemmendedProvider with ChangeNotifier {
  bool _isDataLoaded = false;
  List<TopRemmonedModel> _topRemmonendservices = [];

  List<TopRemmonedModel> get topRemmonendservices => _topRemmonendservices;
  Future<void> fetchServices1() async {
    // Check if data is already loaded
    if (_isDataLoaded) return;

    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString('servicesData');

    if (savedData != null) {
      try {
        final List<dynamic> responseData = json.decode(savedData);
        _topRemmonendservices = responseData
            .map((data) => TopRemmonedModel.fromJson(data))
            .toList();
        _isDataLoaded = true;
        notifyListeners();
      } catch (e) {
        print('Error decoding local data: $e');
        // Handle error or consider re-fetching data
      }
    }

    try {
      // Fetch data from API
      final response = await http.get(Uri.parse(
          '${baseUrl}services/recommended-services?id=7'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        _topRemmonendservices = responseData
            .map((data) => TopRemmonedModel.fromJson(data))
            .toList();

        // Save the data locally
        await prefs.setString('servicesData', response.body);
        print("API response: ${response.body}");
        _isDataLoaded = true;
        notifyListeners();
      } else {
        throw Exception('Failed to load services');
      }
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error or update UI to reflect failure
    }
  }
}
