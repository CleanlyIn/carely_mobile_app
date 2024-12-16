import 'dart:convert';

import 'package:cleanly/models/cart_models.dart';
import 'package:cleanly/models/getcartmodel.dart';
import 'package:cleanly/pages/common%20/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModels> _shoppingCarts = [];
  bool isLoading = true;
   bool _isVisible = true;
   bool _isVisible1 = true;
  late GetCartModel getCart;
  List<Items> getitems = [];
  DateTime selectedValue = DateTime.now();
  final List<int> _selectedIndices = [];
  Map<int, bool> loadingStates = {};
  bool get isVisible => _isVisible;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void setVisibility(bool visible) {
    _isVisible = visible;
    notifyListeners();
  }
  bool get isVisible1 => _isVisible1;

  void toggleVisibility1() {
    _isVisible1 = !_isVisible1;
    notifyListeners();
  }

  void setVisibility1(bool visible1) {
    _isVisible1 = visible1;
    notifyListeners();
  }
  bool isLoadingAtIndex(int index) {
    return loadingStates[index] ?? false;
  }

  Map<int, bool> loadingStates1 = {};

  bool isLoadingAtIndex1(int index) {
    return loadingStates1[index] ?? false;
  }

  String? token;
  List<int> get selectedIndices => _selectedIndices;
  final List<String> _items = [
    "10:00am",
    "11:00am",
    "12:00am",
    "1:00pm",
    "2:00pm",
    "3:00pm",
    "4:00pm",
    "5:00pm",
    "6:00pm",
    "7:00pm",
  ];

  List<String> get items => _items;
  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;

  void removeItem1(String item) {
    _items.remove(item);
    notifyListeners();
  }

  void selectIndex1(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  //
  void selectIndex(int index) {
    if (_selectedIndices.contains(index)) {
      _selectedIndices.remove(index);
    } else {
      _selectedIndices.add(index);
    }
    notifyListeners();
  }

  List<CartModels> get shoppingCarts => _shoppingCarts;
  List<Items> get _getitems => getitems;
  double get cartSubTotal => getCartTotal1();
  double get shippingCharge => 120;
  double get cartTotal => cartSubTotal + shippingCharge;

  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('accesstoken').toString();
    print(">>>>.>.accounntonn...>>>>>>>>>$token");

    getToCartApi();
    await Future.delayed(const Duration(seconds: 2));

    isLoading = false; // Set loading to false after data is loaded

    notifyListeners(); // Notify listeners to update the UI
  }

  //////////////////////////////////////////////////////////////////////////////////////

  //Local Add an item to the cart
 // Add an item to the cart
  Future<void> addItemm1(dynamic productId, String id, index) async {
    var isExist =
        _shoppingCarts.where((element) => element.productId == productId);
    if (isExist.isEmpty) {
      _shoppingCarts.add(CartModels(
        productId: productId,
        quantity: 1,
      ));

      loadingStates[index] = false;
      // await _addToCartApi(id, 1, index);
      // Pass the token here
    } else {
      // If the item exists, increment the quantity
      isExist.first.quantity += 1;
      loadingStates[index] = false;
      // Make the API call to update the cart
      // await _addToCartApi(
      //     id, isExist.first.quantity, index); // Pass the token here
    }
    notifyListeners();
  }

  // Add an item to the cart
  Future<void> addItemm(dynamic productId, String id, index) async {
    var isExist =
        _shoppingCarts.where((element) => element.productId == productId);
    if (isExist.isEmpty) {
      _shoppingCarts.add(CartModels(
        productId: productId,
        quantity: 1,
      ));

      loadingStates[index] = true;
      await _addToCartApi(id, 1, index);
      // Pass the token here
    } else {
      // If the item exists, increment the quantity
      isExist.first.quantity += 1;
      loadingStates[index] = true;
      // Make the API call to update the cart
      await _addToCartApi(
          id, isExist.first.quantity, index); // Pass the token here
    }
    notifyListeners();
  }

  // Remove an item from the cart
  void removeItemm(String productId) {
    _shoppingCarts.removeWhere((element) => element.id == productId);
    notifyListeners();
  }

  // Increment the quantity of an item
  Future<void> incrementQtyy(String productId, String id, int index) async {
    CartModels item =
        _shoppingCarts.where((element) => element.id == productId).first;
    item.quantity++;
    print(">>>>>>>>>>>>>${item.quantity}");
    await _UpdatedaddToCartApi(id, item.quantity, index);

    notifyListeners();
  }

  // Local Increment the quantity of an item
  Future<void> incrementQtyy1(
    String productId,
    String id,
  ) async {
    CartModels item =
        _shoppingCarts.where((element) => element.id == productId).first;
    item.quantity++;
    print(">>>>>>>>>>>>>${item.quantity}");

    notifyListeners();
  }

  // Local Decrement the quantity of an item
  Future<void> decrimentQtyy1(
    dynamic product,
    String id,
  ) async {
    CartModels item =
        _shoppingCarts.where((element) => element.id == product).first;

    if (item.quantity > 1) {
      item.quantity--;
   notifyListeners();
      // Make the API call to update the cart

      // Optionally remove item when quantity reaches 0
    } else {
      item.quantity = 1;
      _shoppingCarts.remove(item);
   notifyListeners();
      // Make the API call to update the cart

      // Optionally remove item when quantity reaches 0
    }
    notifyListeners();
  }

  // Decrement the quantity of an item
  Future<void> decrimentQtyy(dynamic product, String id, int index) async {
    print(
        " decrimentQtyy productId:${product.toString()} Id:${id.toString()}  index:${index}");
    CartModels item =
        _shoppingCarts.where((element) => element.id == product).first;

    if (item.quantity > 1) {
      item.quantity--;

      // Make the API call to update the cart
      await _UpdatedaddToCartApi(id, item.quantity, index);

      // Optionally remove item when quantity reaches 0
    } else {
      item.quantity = 1;
      _shoppingCarts.remove(item);

      // Make the API call to update the cart
      await _UpdatedaddToCartApi(id, item.quantity, index);
      // Optionally remove item when quantity reaches 0
    }
    notifyListeners();
  }

  // Calculate the total number of items in the cart
  int getTotalItems() {
    int total = 0;
    for (var cartItem in _shoppingCarts) {
      total += cartItem.quantity;
    }

    return total;
  }

  // Calculate the total price of all items in the cart
  double getCartTotal1() {
    double total = 0;
    for (var cartItem in _shoppingCarts) {
      total += (cartItem.productId.price! * cartItem.quantity);
    }

    return total;
  }

  Future<void> _addToCartApi(dynamic productId, int quantity, int index) async {
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accesstoken").toString();
    final response = await http.post(
      Uri.parse('${baseUrl}cart/add-to-cart'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Add the token here
      },
      body: jsonEncode({
        'productId': productId,
        'quantity': quantity,
      }),
    );
    print('>>>>>>>>>>>>>>>>>>${jsonEncode({
          'productId': productId,
          'quantity': quantity,
        })}');
    if (response.statusCode == 201) {
      // Successfully added to cart
      loadingStates[index] = false;
      notifyListeners();
      getToCartApi();
      print('Item added to cart: $productId, Quantity: $quantity');
    } else {
      loadingStates[index] = false;
      notifyListeners();
      // Handle error
      print('Failed to add item to cart: ${response.body}');
    }
  }

  Future<void> _UpdatedaddToCartApi(
      dynamic productId, int quantity, int index) async {
    loadingStates1[index] = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accesstoken").toString();
    final response = await http.patch(
      Uri.parse(
          '${baseUrl}cart/update-quantity?productId=$productId&quantity=$quantity'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Add the token here
      },
    );
    print('>>>>>>>>>patch>>>>>>>>>${jsonEncode({
          'productId': productId,
          'quantity': quantity,
        })}');
    if (response.statusCode == 200) {
      // Successfully added to cart

      print(
          'Patch Item added to cart: $productId, Quantity: $quantity,cardId:${response.body}');
      loadingStates1[index] = false;
      print(">>>>>>>>>${loadingStates1[index]}");
      getToCartApi();
      notifyListeners();
    } else {
      loadingStates1[index] = false;
      notifyListeners();
      // Handle error
      print(' Patch Failed to add item to cart: ${response.body}');
    }
  }

  Future<void> getToCartApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accesstoken").toString();
    final response =
        await http.get(Uri.parse('${baseUrl}cart/get-cart'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // Add the token here
    });

    if (response.statusCode == 200) {
      // Successfully added to cart
      getCart = new GetCartModel.fromJson(jsonDecode(response.body));
      print('Item get to getCartcart: ${getCart.totalPrice}');
      getitems = getCart.items!;
      print('Item get to cart: ${getCart.items!.length}');
      notifyListeners();
    } else {
      // Handle error
      print('Failed to add item to cart: ${response.body}');
    }
  }

  Future<void> decrimentQty(dynamic product, int index) async {
    print(" decrimentQtyy productId:${product.id.toString()}  index:${index}");

    if (product.quantity > 1) {
      product.quantity--;

      // Make the API call to update the cart
      await _UpdatedaddToCartApi(
          product.productId.toString(), product.quantity, index);

      // Optionally remove item when quantity reaches 0
    } else {
      product.quantity = 1;
      getitems.remove(product.quantity);

      // Make the API call to update the cart
      await _UpdatedaddToCartApi(
          product.productId.toString(), product.quantity, index);

      // Optionally remove item when quantity reaches 0
    }
    notifyListeners();
  }

  // Increment the quantity of an item
  Future<void> incrementQty(dynamic productId, int index) async {
    productId.quantity++;
    print(">>>>>>>>>>>>>${productId.quantity}");
    await _UpdatedaddToCartApi(
        productId.productId.toString(), productId.quantity, index);

    notifyListeners();
  }

  Future<void> deleteAddToCartApi(dynamic productId, int index) async {
    notifyListeners();
     loadingStates1[index] = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accesstoken").toString();
    final response = await http.delete(
      Uri.parse(
          '${baseUrl}cart/remove?productId=${productId.productId.toString()}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Add the token here
      },
    );
    print('>>>>>>>>>patch>>>>>>>>>${jsonEncode({
          'productId': productId,
        })}');
    if (response.statusCode == 200) {
      // Successfully added to cart
 loadingStates1[index] = false;
      notifyListeners();
      print('Patch Item delete to cart: $productId,cardId:${response.body}');

      getToCartApi();
      notifyListeners();
    } else {
       loadingStates1[index] = false;
      notifyListeners();
      // Handle error
      print(' Patch Failed to add item to cart: ${response.body}');
    }
  }


}
