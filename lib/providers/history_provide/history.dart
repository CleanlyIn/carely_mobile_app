import 'package:flutter/material.dart';

class HistoryProvider with ChangeNotifier {
  late TabController _controller;
  int _currentIndex = 0;

  void setController(TabController controller) {
    _controller = controller;
    _controller.addListener(_handleTabSelection);
  }

  TabController get controller => _controller;

  int get currentIndex => _currentIndex;

  void _handleTabSelection() {
    if (_controller.indexIsChanging) {
      _currentIndex = _controller.index;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
