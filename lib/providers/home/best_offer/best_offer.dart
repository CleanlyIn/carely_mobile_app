
import 'package:flutter/material.dart';

class BestOfferProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  ////////////////call api best booking///////////////
  
  
}
