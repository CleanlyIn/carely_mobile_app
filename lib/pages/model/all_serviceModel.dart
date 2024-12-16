class AllServiceModel {
  int? id;
  String? name;
  String? imageUrl;
  String? route;
  String? pageDescription;
  bool? isActive;
  bool? haveChildren;
  String? createdAt;
  String? updatedAt;
  List<Children>? children;

  AllServiceModel(
      {this.id,
      this.name,
      this.imageUrl,
      this.route,
      this.pageDescription,
      this.isActive,
      this.haveChildren,
      this.createdAt,
      this.updatedAt,
      this.children});

      

  AllServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    route = json['route'];
    pageDescription = json['pageDescription'];
    isActive = json['isActive'];
    haveChildren = json['haveChildren'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['route'] = this.route;
    data['pageDescription'] = this.pageDescription;
    data['isActive'] = this.isActive;
    data['haveChildren'] = this.haveChildren;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Children {
  int? id;
  String? name;
  String? imageUrl;
  int? price;
  dynamic description;
  String? route;
  String? createdAt;
  String? updatedAt;
  int? mainServiceId;
 dynamic parentId;
  bool? haveChildren;
  int? discountPercent;
  String? pageDescription;
  String? productId;
  dynamic bannerId;
  List<SubChildren>? subChildren;

  Children(
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
      this.bannerId,
      this.subChildren});

  Children.fromJson(Map<String, dynamic> json) {
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
    if (json['subChildren'] != null) {
      subChildren = <SubChildren>[];
      json['subChildren'].forEach((v) {
        subChildren!.add(new SubChildren.fromJson(v));
      });
    }
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
    if (this.subChildren != null) {
      data['subChildren'] = this.subChildren!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubChildren {
  int? id;
  String? name;
  String? imageUrl;
  int? price;
  String? description;
  String? route;
  String? createdAt;
  String? updatedAt;
  int? serviceId;
  int? discountPercent;
  String? productId;

  SubChildren(
      {this.id,
      this.name,
      this.imageUrl,
      this.price,
      this.description,
      this.route,
      this.createdAt,
      this.updatedAt,
      this.serviceId,
      this.discountPercent,
      this.productId});

  SubChildren.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    description = json['description'];
    route = json['route'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    serviceId = json['serviceId'];
    discountPercent = json['discountPercent'];
    productId = json['productId'];
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
    data['serviceId'] = this.serviceId;
    data['discountPercent'] = this.discountPercent;
    data['productId'] = this.productId;
    return data;
  }
}
