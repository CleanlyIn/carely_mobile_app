import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  bool _isOnboardingCompleted = false;

  bool get isOnboardingCompleted => _isOnboardingCompleted;
   bool isCentered = false;

  void completeOnboarding() {
    _isOnboardingCompleted = true;
    notifyListeners();
  }
}
