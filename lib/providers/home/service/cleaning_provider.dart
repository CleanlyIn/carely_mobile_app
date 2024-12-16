import 'dart:convert';

import 'package:cleanly/pages/common%20/api_url.dart';
import 'package:cleanly/pages/model/all_serviceModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CleaningProvider with ChangeNotifier {
  int _currentIndex = 0;
  bool showAll = false;
  bool _isDataLoaded = false;
  bool isLoading = false;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<AllServiceModel> _services = [];

  List<AllServiceModel> get services => _services;

  Future<void> fetchServices() async {
    // Check if data is already loaded
    if (_isDataLoaded) return;

    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString('servicesData');

    if (savedData != null) {
      try {
        final List<dynamic> responseData = json.decode(savedData);
        _services =
            responseData.map((data) => AllServiceModel.fromJson(data)).toList();
        _isDataLoaded = true;
        notifyListeners();
      } catch (e) {
        print('Error decoding local data: $e');
        // Handle error or consider re-fetching data
      }
    }

    try {
      // Fetch data from API
      final response = await http.get(
          Uri.parse('${baseUrl}services/all-services'));
      isLoading == true;
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        _services =
            responseData.map((data) => AllServiceModel.fromJson(data)).toList();
        isLoading == false;
        // Save the data locally
        await prefs.setString('servicesData', response.body);
        print("API response: ${response.body}");
        _isDataLoaded = true;
        notifyListeners();
      } else {
        isLoading == false;
        throw Exception('Failed to load services');
      }
    } catch (e) {
      isLoading == false;
      print('Error fetching data: $e');
      // Handle error or update UI to reflect failure
    }
  }

  final ScrollController _scrollController = ScrollController();
  //  final List<CartModel> _shoppingCart = [];

  List<int> _selectedIndices = [];
  List<int> get selectedIndices => _selectedIndices;
  // final ItemScrollController itemScrollController=ItemScrollController();
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void toggle() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

/////////////get cart//////////////

  bool _shouldVisible = false;

  bool get shouldVisible => _shouldVisible;

  void toggleVisibility() {
    _shouldVisible = !_shouldVisible;
    notifyListeners();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void selectIndex(int index) {
    if (_selectedIndices.contains(index)) {
      _selectedIndices.remove(index);
    } else {
      _selectedIndices.add(index);
    }
    notifyListeners();
  }
}
