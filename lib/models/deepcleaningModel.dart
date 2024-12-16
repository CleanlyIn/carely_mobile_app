import 'package:cleanly/models/cartmodel.dart';
class Product {
  final String id;
  final String title;
  final double price;
  final String description;
  final String image;
  final bool isAvailable;

  Product({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.isAvailable, required int id,
  }) : id = uuid.v4();
}