class ShopDataModel {
  ShopDataModel({
    required this.products,
  });

  List<Product> products;

  factory ShopDataModel.fromJson(Map<String, dynamic> json) => ShopDataModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
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
    required this.allImages,
    this.avgRating,
    required this.allcategory,
    required this.allgroup,
    required this.allbrand,
    required this.tags,
    this.isWishlist,
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
  List<AllImage> allImages;
  dynamic avgRating;
  Allcategory allcategory;
  Allgroup allgroup;
  Allbrand allbrand;
  List<AllImage> tags;
  dynamic isWishlist;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        menuId: json["menuId"],
        groupId: json["groupId"],
        categoryId: json["categoryId"],
        brandId: json["brandId"],
        productName: json["productName"],
        model: json["model"],
        description: json["description"],
        briefDescription: json["brief_description"] == null
            ? null
            : json["brief_description"],
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
        allImages: List<AllImage>.from(
            json["allImages"].map((x) => AllImage.fromJson(x))),
        avgRating: json["avgRating"],
        allcategory: Allcategory.fromJson(json["allcategory"]),
        allgroup: Allgroup.fromJson(json["allgroup"]),
        allbrand: Allbrand.fromJson(json["allbrand"]),
        tags:
            List<AllImage>.from(json["tags"].map((x) => AllImage.fromJson(x))),
        isWishlist: json["isWishlist"],
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
        "brief_description": briefDescription == null ? null : briefDescription,
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
        "allImages": List<dynamic>.from(allImages.map((x) => x.toJson())),
        "avgRating": avgRating,
        "allcategory": allcategory.toJson(),
        "allgroup": allgroup.toJson(),
        "allbrand": allbrand.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "isWishlist": isWishlist,
      };
}

class AllImage {
  AllImage({
    this.id,
    this.productId,
    this.url,
    this.tagId,
  });

  int? id;
  int? productId;
  String? url;
  int? tagId;

  factory AllImage.fromJson(Map<String, dynamic> json) => AllImage(
        id: json["id"],
        productId: json["productId"],
        url: json["url"] == null ? null : json["url"],
        tagId: json["tagId"] == null ? null : json["tagId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "url": url == null ? null : url,
        "tagId": tagId == null ? null : tagId,
      };
}

class Allbrand {
  Allbrand({
    this.id,
    this.name,
  });

  int? id;
  Name? name;

  factory Allbrand.fromJson(Map<String, dynamic> json) => Allbrand(
        id: json["id"],
        name: nameValues.map[json["name"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse![name],
      };
}

enum Name { FINESSE }

final nameValues = EnumValues({"Finesse": Name.FINESSE});

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

  factory Allcategory.fromJson(Map<String, dynamic> json) => Allcategory(
        id: json["id"],
        catName: json["catName"],
        menuId: json["menuId"],
        groupId: json["group_id"],
        isFeatured: json["isFeatured"],
        isMenuFeatured: json["isMenuFeatured"],
      );

  Map<String, dynamic> toJson() => {
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
  GroupName? groupName;
  int? discount;

  factory Allgroup.fromJson(Map<String, dynamic> json) => Allgroup(
        id: json["id"],
        menuId: json["menuId"],
        groupName: groupNameValues.map[json["groupName"]],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menuId": menuId,
        "groupName": groupNameValues.reverse![groupName],
        "discount": discount,
      };
}

enum GroupName {
  BAGS,
  CLOTHING,
  FOOTWEAR,
  ACCESSORIES,
  HATS,
  T_SHIRTS,
  HOODIE,
  SWEATSHIRT,
  PANTS
}

final groupNameValues = EnumValues({
  "Accessories": GroupName.ACCESSORIES,
  "Bags": GroupName.BAGS,
  "Clothing": GroupName.CLOTHING,
  "Footwear": GroupName.FOOTWEAR,
  "Hats": GroupName.HATS,
  "Hoodie": GroupName.HOODIE,
  "Pants": GroupName.PANTS,
  "Sweatshirt": GroupName.SWEATSHIRT,
  "T-Shirts": GroupName.T_SHIRTS
});

enum CatName {
  FANNY_PACK,
  DENIM_PANTS,
  SLIDERS,
  CONTRAST_CAP,
  SNAPBACK_CAPS,
  SHOULDERLESS_T_SHIRT,
  HALF_T_SHIRTS,
  DUFFEL_BAG_MEDIUM,
  BASEBALL_CAPS,
  SOCKS,
  WAIST_BAG,
  HOODIES,
  SWEATSHIRT,
  HIGH_NECK_SWEATSHIRT,
  MICRO_BEANIE,
  CARGO_PANTS
}

final catNameValues = EnumValues({
  "Baseball Caps": CatName.BASEBALL_CAPS,
  "Cargo Pants": CatName.CARGO_PANTS,
  "Contrast Cap": CatName.CONTRAST_CAP,
  "Denim Pants": CatName.DENIM_PANTS,
  "Duffel Bag Medium": CatName.DUFFEL_BAG_MEDIUM,
  "Fanny Pack": CatName.FANNY_PACK,
  "Half T-Shirts": CatName.HALF_T_SHIRTS,
  "High neck sweatshirt": CatName.HIGH_NECK_SWEATSHIRT,
  "Hoodies": CatName.HOODIES,
  "Micro beanie": CatName.MICRO_BEANIE,
  "Shoulderless T-shirt": CatName.SHOULDERLESS_T_SHIRT,
  "Sliders": CatName.SLIDERS,
  "Snapback Caps": CatName.SNAPBACK_CAPS,
  "Socks": CatName.SOCKS,
  "Sweatshirt": CatName.SWEATSHIRT,
  "Waist Bag": CatName.WAIST_BAG
});

enum Date { THE_00000000 }

final dateValues = EnumValues({"0000-00-00": Date.THE_00000000});

enum Unit { PCS }

final unitValues = EnumValues({"Pcs": Unit.PCS});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
