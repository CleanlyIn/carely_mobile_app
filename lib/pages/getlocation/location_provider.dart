import 'package:cleanly/pages/common%20/pre_Utils.dart';
import 'package:cleanly/pages/getlocation/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocationProvider with ChangeNotifier {
   Position? _currentPosition;
  String? _currentAddress;

  final LocationService _locationService = LocationService();

  Position? get currentPosition => _currentPosition;
  String? get currentAddress => _currentAddress;

  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentAddress = prefs.getString('address').toString();
    print(">>>>.>.accounntonn...>>>>>>>>>$_currentAddress");

    notifyListeners(); // Notify listeners to update the UI
  }
  Future<void> fetchCurrentLocation() async {
    
    try {
      _currentPosition = await _locationService.getCurrentLocation();
      _currentAddress = await _locationService.getAddressFromLatLng(_currentPosition!);
       PrefUtils().savePreferencesData(
            'address',_currentAddress.toString());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
   @override
  void dispose() {
  
    // Optionally, cancel the subscription or perform other cleanup tasks
    super.dispose();
  }
}
