import 'dart:convert';

import 'package:cleanly/pages/model/all_serviceModel.dart';
import 'package:cleanly/pages/model/search_all.dart';
import 'package:cleanly/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';
class SearchProvider with ChangeNotifier {
  final TextEditingController searchController=TextEditingController();
  List<String> _trendingSearches = [
    'Kitchen',
    'Bathroom',
    'Most Liked',
    'Furnished Apartment',
     'House',
    'UnFurnished Apartment',
    'Pest Control',
    'Covid Disinfection',
    'Terrace',
  
  ];

 String? _selectedSubChildId;

  String? get selectedSubChildId => _selectedSubChildId;

  void setSelectedSubChildId(String? id) {
    _selectedSubChildId = id;
    print(">>>>>>select>>>>>>>>>$_selectedSubChildId");
    notifyListeners(); // Notify listeners when the ID changes
  }



  List<String> _filteredSearches = [];
  bool _isLoading = true;
 bool _isLoading1 = false;
  SearchProvider() {
    _loadTrendingSearches();
  }

  List<String> get filteredSearches => _filteredSearches;
  bool get isLoading => _isLoading;
  bool get isLoading1 => _isLoading1;
 int _currentIndex = 0;
  Future<void> _loadTrendingSearches() async {
    // Simulate a network delay
    await Future.delayed(Duration(milliseconds: 300));
    _filteredSearches = _trendingSearches; // Load all trending searches
    _isLoading = false; // Set loading to false after loading is complete
    notifyListeners(); // Notify listeners about the change
  }

  void filterSearch(String query) {
    if (query.isEmpty) {
      _filteredSearches = _trendingSearches; // Reset to full list if query is empty
    } else {
      _filteredSearches = _trendingSearches
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners(); // Notify listeners about the change
  }
 final List<dynamic> _services1 = [];

  List<dynamic> get services1 => _services1;


//   Future<void> fetchServices() async {
//   // Check if data is already loaded

//  _isLoading = true; // Set loading to true
//     notifyListeners();

//   try {
//     // Fetch data from API
//     final response = await http.get(Uri.parse('https://prod.carely.me/api/v1/services/search?name=${searchController.text}'));

//     if (response.statusCode == 200) {
//       final List<dynamic> responseData = json.decode(response.body);
      
//       _services = responseData.map((data) => AllServiceModel.fromJson(data)).toList();
     
//       // Save the data locally
   
//       print("API response _services: ${_services.length}");
 
//       _isLoading = false;
//        await Future.delayed(const Duration(seconds: 1));
//       notifyListeners();
//     } else {
//         _isLoading = false;
//       throw Exception('Failed to load services');
//     }
//   } catch (e) {
//       _isLoading = false;
//     print('Error fetching data: $e');
//     // Handle error or update UI to reflect failure
//   }finally {
//       _isLoading = false; // Set loading to false after the call
//       notifyListeners(); // Notify listeners to rebuild the UI
//     }
//  }


//   String _currentRoute = '/';

//   String get currentRoute => _currentRoute;

//   void updateRoute(String newRoute) {
//     _currentRoute = newRoute;
//     notifyListeners();
//   }
  int? _selectedIndex; // Nullable to handle no selection initially
  List<AllServiceModel> _services = [];

  // Getter for selected index
  int? get selectedIndex => _selectedIndex;

  // Getter for services
  List<AllServiceModel> get services => _services;

  // Function to set selected index
  void setSelectedIndex(int index) {
    if (index >= 0 && index < _services.length) {
      _selectedIndex = index;
      notifyListeners(); // Notify listeners to update UI
    } else {
      print('Index out of range');
    }
  }

 Future<void> fetchServices(String searchName) async {
  // Check if data is already loaded
  _isLoading = true; // Set loading to true
  notifyListeners();

  try {
    // Fetch first API data
    final response1 = await http.get(Uri.parse('https://prod.carely.me/api/v1/services/search?name=${searchName}'));

    // Fetch second API data
    final response2 = await http.get(Uri.parse('https://prod.carely.me/api/v1/services/all-services'));

    if (response1.statusCode == 200 && response2.statusCode == 200) {
      // Parse both responses
      final List<dynamic> responseData1 = json.decode(response1.body);
      final List<dynamic> responseData2 = json.decode(response2.body);

      // Combine both responses into one list
      _services = [
        ...responseData1.map((data) => AllServiceModel.fromJson(data)).toList(),
        ...responseData2.map((data) => AllServiceModel.fromJson(data)).toList(),
      ];

      // Save the combined data locally
      print("Combined API response _services: ${_services[0].children!.length}");

      _isLoading = false;
      await Future.delayed(const Duration(seconds: 1));
      notifyListeners();
    } else {
      _isLoading = false;
      throw Exception('Failed to load services from one or both APIs');
    }
  } catch (e) {
    _isLoading = false;
    print('Error fetching data: $e');
    // Handle error or update UI to reflect failure
  } finally {
    _isLoading = false; // Set loading to false after the call
    notifyListeners(); // Notify listeners to rebuild the UI
  }
}

}
