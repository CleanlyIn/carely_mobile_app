

import 'package:cleanly/pages/model/all_serviceModel.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CartModel {
  final String id;
  final SubChildren product;
  int quantity;

  CartModel({
    required this.product,
    required this.quantity,
  }) : id = uuid.v4();
}
