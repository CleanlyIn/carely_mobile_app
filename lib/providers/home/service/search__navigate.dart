import 'dart:convert';

import 'package:cleanly/pages/common%20/api_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// Import your service package

class SearchAndNavigatePage extends StatefulWidget {
  const SearchAndNavigatePage({super.key});

  @override
  _SearchAndNavigatePageState createState() => _SearchAndNavigatePageState();
}

class _SearchAndNavigatePageState extends State<SearchAndNavigatePage> {
  List<dynamic>? allServices; // All Services List
  String? error;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAllServices();
  }

  // Function to fetch all services from the API
  Future<void> _fetchAllServices() async {
    try {
      final response =
          await Service.getAllServices(); // Call your All Services API
      setState(() {
        allServices = response;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  // Function to search using Search API and get route
  Future<void> _searchAndNavigate(String searchQuery) async {
    try {
      final searchResponse =
          await Service.getServicesSearch(searchQuery); // Call your Search API
      final String matchedRoute =
          searchResponse[0]['route']; // Get the route from search response

      // Now call the matcher to find and navigate to the matched service in allServices
      _routeMatcher(matchedRoute);
    } catch (e) {
      print("Error in search: $e");
    }
  }

  // Function to match the route in allServices and navigate
  void _routeMatcher(String matchedRoute) {
    if (allServices != null && allServices!.isNotEmpty) {
      for (var service in allServices!) {
        if (service['route'] == matchedRoute) {
          // Navigate to the matched route
          Navigator.pushNamed(context, matchedRoute, arguments: service);
          return;
        }

        // If there are children in the service, search in them as well
        if (service['children'] != null) {
          for (var child in service['children']) {
            if (child['route'] == matchedRoute) {
              // Navigate to the matched child route
              Navigator.pushNamed(context, matchedRoute, arguments: child);
              return;
            }
          }
        }
      }

      print("No matching route found in all services");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search & Navigate'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : allServices != null
              ? Column(
                  children: [
                    TextField(
                      onSubmitted: (query) {
                        _searchAndNavigate(
                            query); // Trigger search and navigate
                      },
                      decoration: const InputDecoration(
                        hintText: "Search Services",
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: allServices!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(allServices![index]
                                ['name']), // Display service name
                            onTap: () {
                              // Optional: Navigate when selecting service from all services
                              final route = allServices![index]['route'];
                              Navigator.pushNamed(context, route,
                                  arguments: allServices![index]);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              : const Center(child: Text('No services available')),
    );
  }
}

class Service {
  static Future<List<dynamic>> getAllServices() async {
    final response =
        await http.get(Uri.parse('${baseUrl}services/all-services'));
    if (response.statusCode == 200) {
      final List<dynamic> services = jsonDecode(response.body);

      // Return the decoded services list
      return services;
    } else {
      throw Exception('Failed to load services');
    }
  }

  static Future<List<dynamic>> getServicesSearch(String query) async {
    final response =
        await http.get(Uri.parse('${baseUrl}services/search?name==$query'));
    if (response.statusCode == 200) {
      final List<dynamic> searchResults = jsonDecode(response.body);

      // Return the decoded search results
      return searchResults;
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
