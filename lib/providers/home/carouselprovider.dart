
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class CarouselProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  final CarouselController carouselController = CarouselController();
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
