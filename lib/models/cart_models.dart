


import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CartModels {
  final String id;
  final dynamic productId;
  int quantity;

  CartModels({
    required this.productId,
    required this.quantity,
  }) : id = uuid.v4();
}
