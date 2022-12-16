class ProductRecommendationModel {
  ProductRecommendationModel({
    required this.product,
  });

  List<Product> product;

  factory ProductRecommendationModel.fromJson(Map<String?, dynamic> json) =>
      ProductRecommendationModel(
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
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
    required this.details,
    required this.allImages,
    required this.allgroup,
    required this.allcategory,
    required this.allbrand,
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
  Details details;
  List<AllImage> allImages;
  Allgroup allgroup;
  Allcategory allcategory;
  Allbrand allbrand;

  factory Product.fromJson(Map<String?, dynamic> json) => Product(
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
        details: Details.fromJson(json["details"]),
        allImages: List<AllImage>.from(
            json["allImages"].map((x) => AllImage.fromJson(x))),
        allgroup: Allgroup.fromJson(json["allgroup"]),
        allcategory: Allcategory.fromJson(json["allcategory"]),
        allbrand: Allbrand.fromJson(json["allbrand"]),
      );

  Map<String?, dynamic> toJson() => {
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
        "details": details.toJson(),
        "allImages": List<dynamic>.from(allImages.map((x) => x.toJson())),
        "allgroup": allgroup.toJson(),
        "allcategory": allcategory.toJson(),
        "allbrand": allbrand.toJson(),
      };
}

class AllImage {
  AllImage({
    this.id,
    this.productId,
    this.url,
  });

  int? id;
  int? productId;
  String? url;

  factory AllImage.fromJson(Map<String?, dynamic> json) => AllImage(
        id: json["id"],
        productId: json["productId"],
        url: json["url"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "url": url,
      };
}

class Allbrand {
  Allbrand({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Allbrand.fromJson(Map<String?, dynamic> json) => Allbrand(
        id: json["id"],
        name: json["name"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Allcategory {
  Allcategory({
    this.id,
    this.catName,
    this.menuId,
    this.groupId,
    this.isFeatured,
    this.isMenuFeatured,
  });

  int? id;
  String? catName;
  int? menuId;
  int? groupId;
  int? isFeatured;
  int? isMenuFeatured;

  factory Allcategory.fromJson(Map<String?, dynamic> json) => Allcategory(
        id: json["id"],
        catName: json["catName"],
        menuId: json["menuId"],
        groupId: json["group_id"],
        isFeatured: json["isFeatured"],
        isMenuFeatured: json["isMenuFeatured"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "catName": catName,
        "menuId": menuId,
        "group_id": groupId,
        "isFeatured": isFeatured,
        "isMenuFeatured": isMenuFeatured,
      };
}

class Allgroup {
  Allgroup({
    this.id,
    this.menuId,
    this.groupName,
    this.discount,
  });

  int? id;
  int? menuId;
  String? groupName;
  int? discount;

  factory Allgroup.fromJson(Map<String?, dynamic> json) => Allgroup(
        id: json["id"],
        menuId: json["menuId"],
        groupName: json["groupName"],
        discount: json["discount"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "menuId": menuId,
        "groupName": groupName,
        "discount": discount,
      };
}

class Details {
  Details({
    this.color,
  });

  dynamic color;

  factory Details.fromJson(Map<String?, dynamic> json) => Details(
        color: json["Color"],
      );

  Map<String?, dynamic> toJson() => {
        "Color": color,
      };
}
