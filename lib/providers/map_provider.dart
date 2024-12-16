// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';

// class MapProvider with ChangeNotifier {
//   String _address = '';
//   String get address => _address;

//   Future<void> getAddressFromLatLng(double latitude, double longitude) async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
//       Placemark place = placemarks[0];
//       _address = '${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}';
//       notifyListeners();
//     } catch (e) {
//       _address = 'Error fetching address';
//       notifyListeners();
//     }
//   }
// }
