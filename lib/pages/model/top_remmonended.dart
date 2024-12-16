class TopRemmonedModel {
  int? id;
  String? name;
  String? imageUrl;
  int? price;
  String? description;
  String? route;
  String? createdAt;
  String? updatedAt;
  int? mainServiceId;
  dynamic parentId;
  bool? haveChildren;
  int? discountPercent;
  dynamic pageDescription;
  String? productId;
 dynamic bannerId;

  TopRemmonedModel(
      {this.id,
      this.name,
      this.imageUrl,
      this.price,
      this.description,
      this.route,
      this.createdAt,
      this.updatedAt,
      this.mainServiceId,
      this.parentId,
      this.haveChildren,
      this.discountPercent,
      this.pageDescription,
      this.productId,
      this.bannerId});

  TopRemmonedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    description = json['description'];
    route = json['route'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    mainServiceId = json['mainServiceId'];
    parentId = json['parentId'];
    haveChildren = json['haveChildren'];
    discountPercent = json['discountPercent'];
    pageDescription = json['pageDescription'];
    productId = json['productId'];
    bannerId = json['bannerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['description'] = this.description;
    data['route'] = this.route;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['mainServiceId'] = this.mainServiceId;
    data['parentId'] = this.parentId;
    data['haveChildren'] = this.haveChildren;
    data['discountPercent'] = this.discountPercent;
    data['pageDescription'] = this.pageDescription;
    data['productId'] = this.productId;
    data['bannerId'] = this.bannerId;
    return data;
  }
}
