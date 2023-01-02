import 'dart:core';

class ProductsCategory {
  ProductsCategory({
    required this.featuredProducts,
    required this.newProducts,
    required this.middlePromotionalCard,
  });

  List<Product> featuredProducts;
  List<Product> newProducts;
  List<MiddlePromotionalCard> middlePromotionalCard;

  factory ProductsCategory.fromJson(Map<String, dynamic> json) =>
      ProductsCategory(
        featuredProducts: List<Product>.from(
            json["featuredProducts"].map((x) => Product.fromJson(x))),
        newProducts: List<Product>.from(
            json["newProducts"].map((x) => Product.fromJson(x))),
        middlePromotionalCard: List<MiddlePromotionalCard>.from(
            json["middlePromotionalCard"]
                .map((x) => MiddlePromotionalCard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "featuredProducts":
            List<dynamic>.from(featuredProducts.map((x) => x.toJson())),
        "newProducts": List<dynamic>.from(newProducts.map((x) => x.toJson())),
        "middlePromotionalCard":
            List<dynamic>.from(middlePromotionalCard.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.menuId,
    this.groupId,
    this.categoryId,
    this.brandId,
    this.productName,
    this.model,
    this.description,
    this.briefDescription,
    this.sellingPrice,
    this.averageBuyingPrice,
    this.productImage,
    this.images,
    this.isNew,
    this.totalSale,
    this.isFeatured,
    this.stock,
    this.discount,
    this.adminDiscount,
    this.appDiscount,
    this.openingQuantity,
    this.openingUnitPrice,
    this.isAvailable,
    required this.createdAt,
    required this.updatedAt,
    required this.details,
    required this.allgroup,
  });

  int? id;
  int? menuId;
  int? groupId;
  int? categoryId;
  int? brandId;
  String? productName;
  String? model;
  String? description;
  String? briefDescription;
  int? sellingPrice;
  String? averageBuyingPrice;
  String? productImage;
  String? images;
  int? isNew;
  int? totalSale;
  int? isFeatured;
  int? stock;
  int? discount;
  int? adminDiscount;
  int? appDiscount;
  String? openingQuantity;
  String? openingUnitPrice;
  int? isAvailable;
  DateTime createdAt;
  DateTime updatedAt;
  Details details;
  Allgroup allgroup;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        menuId: json["menuId"],
        groupId: json["groupId"],
        categoryId: json["categoryId"],
        brandId: json["brandId"],
        productName: json["productName"],
        model: json["model"],
        description: json["description"],
        briefDescription: json["brief_description"],
        sellingPrice: json["sellingPrice"],
        averageBuyingPrice: json["averageBuyingPrice"],
        productImage: json["productImage"],
        images: json["images"],
        isNew: json["isNew"],
        totalSale: json["totalSale"],
        isFeatured: json["isFeatured"],
        stock: json["stock"],
        discount: json["discount"],
        adminDiscount: json["adminDiscount"],
        appDiscount: json["appDiscount"],
        openingQuantity: json["openingQuantity"],
        openingUnitPrice: json["openingUnitPrice"],
        isAvailable: json["isAvailable"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        details: Details.fromJson(json["details"]),
        allgroup: Allgroup.fromJson(json["allgroup"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menuId": menuId,
        "groupId": groupId,
        "categoryId": categoryId,
        "brandId": brandId,
        "productName": productName,
        "model": model,
        "description": description,
        "brief_description": briefDescription,
        "sellingPrice": sellingPrice,
        "averageBuyingPrice": averageBuyingPrice,
        "productImage": productImage,
        "images": images,
        "isNew": isNew,
        "totalSale": totalSale,
        "isFeatured": isFeatured,
        "stock": stock,
        "discount": discount,
        "adminDiscount": adminDiscount,
        "appDiscount": appDiscount,
        "openingQuantity": openingQuantity,
        "openingUnitPrice": openingUnitPrice,
        "isAvailable": isAvailable,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "details": details.toJson(),
        "allgroup": allgroup.toJson(),
      };
}

class Allgroup {
  Allgroup({
    this.id,
    this.menuId,
    this.groupName,
    this.discount,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  int? menuId;
  String? groupName;
  int? discount;
  DateTime createdAt;
  DateTime updatedAt;

  factory Allgroup.fromJson(Map<String, dynamic> json) => Allgroup(
        id: json["id"],
        menuId: json["menuId"],
        groupName: json["groupName"],
        discount: json["discount"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menuId": menuId,
        "groupName": groupName,
        "discount": discount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Details {
  Details({
    this.color,
    this.size,
  });

  String? color;
  String? size;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        color: json["Color"],
        size: json["Size"],
      );

  Map<String, dynamic> toJson() => {
        "Color": color,
        "Size": size,
      };
}

class MiddlePromotionalCard {
  MiddlePromotionalCard({
    this.id,
    this.subHeader,
    this.header,
    this.buttonText,
    this.link,
    this.appLink,
    this.image,
    this.color,
    this.backgroundColor,
    this.createdAt,
    required this.updatedAt,
  });

  int? id;
  dynamic subHeader;
  String? header;
  dynamic buttonText;
  String? link;
  String? appLink;
  String? image;
  String? color;
  String? backgroundColor;
  dynamic createdAt;
  DateTime updatedAt;

  factory MiddlePromotionalCard.fromJson(Map<String, dynamic> json) =>
      MiddlePromotionalCard(
        id: json["id"],
        subHeader: json["subHeader"],
        header: json["header"],
        buttonText: json["buttonText"],
        link: json["link"],
        appLink: json["appLink"],
        image: json["image"],
        color: json["color"],
        backgroundColor: json["backgroundColor"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subHeader": subHeader,
        "header": header,
        "buttonText": buttonText,
        "link": link,
        "appLink": appLink,
        "image": image,
        "color": color,
        "backgroundColor": backgroundColor,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
      };
}
