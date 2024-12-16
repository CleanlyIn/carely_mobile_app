class AllSearchServiceModel {
  int? id;
  String? name;
  String? imageUrl;
  int? price;
  String? description;
  String? route;
  bool? haveChildren;
  int? discountPercent;
  String? pageDescription;
  String? createdAt;
  String? updatedAt;
  int? mainServiceId;
  Null? parentId;
  List<SubChildren>? subChildren;

  AllSearchServiceModel(
      {this.id,
      this.name,
      this.imageUrl,
      this.price,
      this.description,
      this.route,
      this.haveChildren,
      this.discountPercent,
      this.pageDescription,
      this.createdAt,
      this.updatedAt,
      this.mainServiceId,
      this.parentId,
      this.subChildren});

  AllSearchServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    description = json['description'];
    route = json['route'];
    haveChildren = json['haveChildren'];
    discountPercent = json['discountPercent'];
    pageDescription = json['pageDescription'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    mainServiceId = json['mainServiceId'];
    parentId = json['parentId'];
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
    data['haveChildren'] = this.haveChildren;
    data['discountPercent'] = this.discountPercent;
    data['pageDescription'] = this.pageDescription;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['mainServiceId'] = this.mainServiceId;
    data['parentId'] = this.parentId;
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
  int? discountPercent;
  String? createdAt;
  String? updatedAt;
  int? serviceId;

  SubChildren(
      {this.id,
      this.name,
      this.imageUrl,
      this.price,
      this.description,
      this.route,
      this.discountPercent,
      this.createdAt,
      this.updatedAt,
      this.serviceId});

  SubChildren.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    description = json['description'];
    route = json['route'];
    discountPercent = json['discountPercent'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    serviceId = json['serviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['description'] = this.description;
    data['route'] = this.route;
    data['discountPercent'] = this.discountPercent;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['serviceId'] = this.serviceId;
    return data;
  }
}
class ServiceChildren {
  int? id;
  String? name;
  String? imageUrl;
  String? route;
  String? createdAt;
  String? updatedAt;
  bool? isActive;
  bool? haveChildren;
  String? pageDescription;
  Null? bannerId;
  List<Children>? children;

  ServiceChildren(
      {this.id,
      this.name,
      this.imageUrl,
      this.route,
      this.createdAt,
      this.updatedAt,
      this.isActive,
      this.haveChildren,
      this.pageDescription,
      this.bannerId,
      this.children});

  ServiceChildren.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    route = json['route'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isActive = json['isActive'];
    haveChildren = json['haveChildren'];
    pageDescription = json['pageDescription'];
    bannerId = json['bannerId'];
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
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['isActive'] = this.isActive;
    data['haveChildren'] = this.haveChildren;
    data['pageDescription'] = this.pageDescription;
    data['bannerId'] = this.bannerId;
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
  String? description;
  String? route;
  String? createdAt;
  String? updatedAt;
  int? mainServiceId;
  Null? parentId;
  bool? haveChildren;
  int? discountPercent;
  Null? pageDescription;
  String? productId;
  Null? bannerId;
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
