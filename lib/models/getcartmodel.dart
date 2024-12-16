class GetCartModel {
  int? id;
  int? userId;
  String? createdAt;
  String? updatedAt;
  List<Items>? items;
  dynamic totalPrice;
  dynamic totalDiscountedPrice;

  GetCartModel(
      {this.id,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.items,
      this.totalPrice,
      this.totalDiscountedPrice});

  GetCartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    totalDiscountedPrice = json['totalDiscountedPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    data['totalDiscountedPrice'] = this.totalDiscountedPrice;
    return data;
  }
}

class Items {
  int? id;
  String? productId;
  int? quantity;
  int? priceAtAdd;
  dynamic discountedPrice;
  dynamic totalPriceWithDiscount;
  ServiceDetails? serviceDetails;

  Items(
      {this.id,
      this.productId,
      this.quantity,
      this.priceAtAdd,
      this.discountedPrice,
      this.totalPriceWithDiscount,
      this.serviceDetails});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    quantity = json['quantity'];
    priceAtAdd = json['priceAtAdd'];
    discountedPrice = json['discountedPrice'];
    totalPriceWithDiscount = json['totalPriceWithDiscount'];
    serviceDetails = json['serviceDetails'] != null
        ? new ServiceDetails.fromJson(json['serviceDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    data['priceAtAdd'] = this.priceAtAdd;
    data['discountedPrice'] = this.discountedPrice;
    data['totalPriceWithDiscount'] = this.totalPriceWithDiscount;
    if (this.serviceDetails != null) {
      data['serviceDetails'] = this.serviceDetails!.toJson();
    }
    return data;
  }
}

class ServiceDetails {
  int? index;
  int? id;
  String? name;
  String? imageUrl;
  dynamic price;
  dynamic discountPercent;
  String? description;
  String? route;

  ServiceDetails(
      {this.index,
      this.id,
      this.name,
      this.imageUrl,
      this.price,
      this.discountPercent,
      this.description,
      this.route});

  ServiceDetails.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    discountPercent = json['discountPercent'];
    description = json['description'];
    route = json['route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['discountPercent'] = this.discountPercent;
    data['description'] = this.description;
    data['route'] = this.route;
    return data;
  }
}
