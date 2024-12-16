
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoriesProvider with ChangeNotifier {
  
  int _currentIndex = 0;

  final ScrollController _scrollController = ScrollController();
  final ItemScrollController itemScrollController=ItemScrollController();
     bool _isVisible = false;

  bool get isVisible => _isVisible;

  void toggleVisibility() {
    _isVisible = true;
    notifyListeners();
  }
 int _visibleIndex = -1; // Initialize with -1 to indicate no item is visible
  
  int get visibleIndex => _visibleIndex;

  void setVisibleIndex(int index) {
    _visibleIndex = index;
    notifyListeners();
  }

  void resetVisibleIndex() {
    _visibleIndex = -1;
    notifyListeners();
  }
      void scrollToIndex(int index) {
    itemScrollController.scrollTo(
      index: index,
      duration:const Duration(seconds: 1),
      curve: Curves.easeInCubic,
    );
  }

  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
    @override
  void dispose() {
    _scrollController.dispose(); 
 // Dispose of the TabController
    super.dispose();
  }


}

