import 'package:flutter/material.dart';

class TimeSlotProvider with ChangeNotifier {
  final List<String> _morningSlot = [
    "10:00pm-1:20pm",
    "2:00pm-3:00pm",
    "12:40pm-01:30pm",
    "1:40pm-2:30pm",
    "3:00pm-4:00pm",
  ];

  List<String> get morningSlot => _morningSlot;

  void addTimeSlot(String slot) {
    _morningSlot.add(slot);
    notifyListeners();
  }

  void removeTimeSlot(int index) {
    _morningSlot.removeAt(index);
    notifyListeners();
  }
}