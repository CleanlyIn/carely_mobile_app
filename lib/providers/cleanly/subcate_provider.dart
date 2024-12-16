import 'package:cleanly/models/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SubCategoryProvider extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();
  final List<CartModel> _shoppingCart = [];

  List<int> _selectedIndices = [];
  List<int> get selectedIndices => _selectedIndices;
  final ItemScrollController itemScrollController = ItemScrollController();
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
