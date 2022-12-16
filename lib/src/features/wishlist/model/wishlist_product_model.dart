class WishlistModel {
  WishlistModel({
    required this.wishlist,
  });

  Wishlist wishlist;

  factory WishlistModel.fromJson(Map<String?, dynamic> json) => WishlistModel(
        wishlist: Wishlist.fromJson(json["wishlist"]),
      );

  Map<String?, dynamic> toJson() => {
        "wishlist": wishlist.toJson(),
      };
}

class Wishlist {
  Wishlist({
    this.total,
    this.perPage,
    this.page,
    this.lastPage,
    required this.data,
  });

  int? total;
  int? perPage;
  int? page;
  int? lastPage;
  List<Datum> data;

  factory Wishlist.fromJson(Map<String?, dynamic> json) => Wishlist(
        total: json["total"],
        perPage: json["perPage"],
        page: json["page"],
        lastPage: json["lastPage"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "total": total,
        "perPage": perPage,
        "page": page,
        "lastPage": lastPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.productId,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  int? id;
  int? userId;
  int? productId;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;

  factory Datum.fromJson(Map<String?, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        productId: json["productId"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "productId": productId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "product": product.toJson(),
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
    required this.allcategory,
    required this.allbrand,
    required this.allImages,
    this.avgRating,
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
  Allcategory allcategory;
  Allbrand allbrand;
  List<AllImage> allImages;
  dynamic avgRating;

  factory Product.fromJson(Map<String?, dynamic> json) => Product(
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
        details: Details.fromJson(json["details"]),
        allgroup: Allgroup.fromJson(json["allgroup"]),
        allcategory: Allcategory.fromJson(json["allcategory"]),
        allbrand: Allbrand.fromJson(json["allbrand"]),
        allImages: List<AllImage>.from(
            json["allImages"].map((x) => AllImage.fromJson(x))),
        avgRating: json["avgRating"],
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "details": details.toJson(),
        "allgroup": allgroup.toJson(),
        "allcategory": allcategory.toJson(),
        "allbrand": allbrand.toJson(),
        "allImages": List<dynamic>.from(allImages.map((x) => x.toJson())),
        "avgRating": avgRating,
      };
}

class AllImage {
  AllImage({
    this.id,
    this.productId,
    this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  int? productId;
  String? url;
  DateTime createdAt;
  DateTime updatedAt;

  factory AllImage.fromJson(Map<String?, dynamic> json) => AllImage(
        id: json["id"],
        productId: json["productId"],
        url: json["url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "url": url,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Allbrand {
  Allbrand({
    this.id,
    this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  String? name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Allbrand.fromJson(Map<String?, dynamic> json) => Allbrand(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
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
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  String? catName;
  int? menuId;
  int? groupId;
  int? isFeatured;
  int? isMenuFeatured;
  DateTime createdAt;
  DateTime updatedAt;

  factory Allcategory.fromJson(Map<String?, dynamic> json) => Allcategory(
        id: json["id"],
        catName: json["catName"],
        menuId: json["menuId"],
        groupId: json["group_id"],
        isFeatured: json["isFeatured"],
        isMenuFeatured: json["isMenuFeatured"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "catName": catName,
        "menuId": menuId,
        "group_id": groupId,
        "isFeatured": isFeatured,
        "isMenuFeatured": isMenuFeatured,
        "created_at": createdAt,
        "updated_at": updatedAt,
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

  factory Allgroup.fromJson(Map<String?, dynamic> json) => Allgroup(
        id: json["id"],
        menuId: json["menuId"],
        groupName: json["groupName"],
        discount: json["discount"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "menuId": menuId,
        "groupName": groupName,
        "discount": discount,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Details {
  Details({
    this.color,
    this.size,
  });

  String? color;
  String? size;

  factory Details.fromJson(Map<String?, dynamic> json) => Details(
        color: json["Color"],
        size: json["Size"] == null ? null : json["Size"],
      );

  Map<String?, dynamic> toJson() => {
        "Color": color,
        "Size": size,
      };
}
