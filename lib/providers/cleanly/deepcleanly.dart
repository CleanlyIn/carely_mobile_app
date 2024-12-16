import 'package:cleanly/models/deepcleaningModel.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class deepCleanProvider extends ChangeNotifier {
  final ItemScrollController itemScrollController = ItemScrollController();
  final List<Product> imageUrls = [
    Product(
        id: 1,
        title: 'Kitchen Cleaning',
        price: 33,
        description:
            'This is the detail view of the selected item. You can display more information here.',
        image: 'https://via.placeholder.com/50x50',
        isAvailable: true),
    Product(
        id: 2,
        title: 'Bathroom Cleaning',
        price: 40,
        description:
            'This is the detail view of the selected item. You can display more information here.',
        image: 'https://via.placeholder.com/50x50',
        isAvailable: true),
    Product(
        id: 3,
        title: 'Balcony Cleaning',
        price: 50,
        description:
            'This is the detail view of the selected item. You can display more information here.',
        image: 'https://via.placeholder.com/50x50',
        isAvailable: true),
  ];

  List<Product> get images => imageUrls;

  void scrollToIndex(int index) {
    itemScrollController.scrollTo(
      index: index,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInCubic,
    );
  }
}
