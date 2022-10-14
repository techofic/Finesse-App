class ProductDetailsModel {
  ProductDetailsModel({
    required this.allVariation,
    required this.product,
  });

  List<AllVariation> allVariation;
  Product product;

  factory ProductDetailsModel.fromJson(Map<String?, dynamic> json) =>
      ProductDetailsModel(
        allVariation: List<AllVariation>.from(
            json["allVariation"].map((x) => AllVariation.fromJson(x))),
        product: Product.fromJson(json["product"]),
      );

  Map<String?, dynamic> toJson() => {
        "allVariation": List<dynamic>.from(allVariation.map((x) => x.toJson())),
        "product": product.toJson(),
      };
}

class AllVariation {
  AllVariation({
    this.id,
    this.mproductId,
    this.name,
    required this.values,
  });

  int? id;
  int? mproductId;
  String? name;
  List<Value> values;

  factory AllVariation.fromJson(Map<String?, dynamic> json) => AllVariation(
        id: json["id"],
        mproductId: json["mproductId"],
        name: json["name"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "mproductId": mproductId,
        "name": name,
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    this.pvariationId,
    this.value,
  });

  int? pvariationId;
  String? value;

  factory Value.fromJson(Map<String?, dynamic> json) => Value(
        pvariationId: json["pvariationId"],
        value: json["value"],
      );

  Map<String?, dynamic> toJson() => {
        "pvariationId": pvariationId,
        "value": value,
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
    required this.images,
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
    this.isWishlist,
    required this.allgroup,
    required this.menu,
    required this.allcategory,
    required this.allbrand,
    required this.tags,
    required this.allImages,
    this.avgRating,
    required this.meta,
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
  List<ProductImage> images;
  List<Value>? color;
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
  dynamic isWishlist;
  Allgroup allgroup;
  Menu menu;
  Allcategory allcategory;
  Allbrand allbrand;
  List<AllImage> tags;
  List<AllImage> allImages;
  dynamic avgRating;
  Meta meta;

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
        images: List<ProductImage>.from(json["images"].map((x) => ProductImage.fromJson(x))),
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
        isWishlist: json["isWishlist"],
        allgroup: Allgroup.fromJson(json["allgroup"]),
        menu: Menu.fromJson(json["menu"]),
        allcategory: Allcategory.fromJson(json["allcategory"]),
        allbrand: Allbrand.fromJson(json["allbrand"]),
        tags:
            List<AllImage>.from(json["tags"].map((x) => AllImage.fromJson(x))),
        allImages: List<AllImage>.from(
            json["allImages"].map((x) => AllImage.fromJson(x))),
        avgRating: json["avgRating"],
        meta: Meta.fromJson(json["__meta__"]),
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
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
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
        "isWishlist": isWishlist,
        "allgroup": allgroup.toJson(),
        "menu": menu.toJson(),
        "allcategory": allcategory.toJson(),
        "allbrand": allbrand.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "allImages": List<dynamic>.from(allImages.map((x) => x.toJson())),
        "avgRating": avgRating,
        "__meta__": meta.toJson(),
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

  factory AllImage.fromJson(Map<String?, dynamic> json) => AllImage(
        id: json["id"],
        productId: json["productId"],
        url: json["url"] == null ? null : json["url"],
        tagId: json["tagId"] == null ? null : json["tagId"],
      );

  Map<String?, dynamic> toJson() => {
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

  String? color;

  factory Details.fromJson(Map<String?, dynamic> json) => Details(
        color: json["Color"],
      );

  Map<String?, dynamic> toJson() => {
        "Color": color,
      };
}

class ProductImage {
  ProductImage({
    this.url,
  });

  String? url;

  factory ProductImage.fromJson(Map<String?, dynamic> json) => ProductImage(
        url: json["url"],
      );

  Map<String?, dynamic> toJson() => {
        "url": url,
      };
}

class Menu {
  Menu({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Menu.fromJson(Map<String?, dynamic> json) => Menu(
        id: json["id"],
        name: json["name"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Meta {
  Meta({
    this.allreviewsCount,
  });

  int? allreviewsCount;

  factory Meta.fromJson(Map<String?, dynamic> json) => Meta(
        allreviewsCount: json["allreviews_count"],
      );

  Map<String?, dynamic> toJson() => {
        "allreviews_count": allreviewsCount,
      };
}
