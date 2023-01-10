class ProductDetailsModel {
  ProductDetailsModel({
    this.success = true,
    this.allVariation,
    this.allVariationProduct,
    this.product,
  });

  bool success;
  List<AllVariation>? allVariation;
  List<AllVariationProduct>? allVariationProduct;
  Product? product;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
        success: json["success"],
        allVariation: List<AllVariation>.from((json["allVariation"] ?? []).map((x) => AllVariation.fromJson(x))),
        allVariationProduct: List<AllVariationProduct>.from((json["allVariationProduct"] ?? []).map((x) => AllVariationProduct.fromJson(x))),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "allVariation": List<dynamic>.from((allVariation ?? []).map((x) => x.toJson())),
        "allVariationProduct": List<dynamic>.from((allVariationProduct ?? []).map((x) => x.toJson())),
        "product": product?.toJson(),
      };
}

class AllVariation {
  AllVariation({
    this.id,
    this.mproductId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.values,
    this.isDisabled,
  });

  int? id;
  int? mproductId;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;
  List<Value>? values;
  bool? isDisabled;

  factory AllVariation.fromJson(Map<String, dynamic> json) => AllVariation(
        id: json["id"],
        mproductId: json["mproductId"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
        isDisabled: json["isDisabled"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mproductId": mproductId,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "values": List<dynamic>.from((values ?? []).map((x) => x.toJson())),
        "isDisabled": isDisabled,
      };
}

class Value {
  Value({
    this.pvariationId,
    this.value,
    this.isDisabled = false,
  });

  int? pvariationId;
  String? value;
  bool isDisabled;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        pvariationId: json["pvariationId"],
        value: json["value"],
        isDisabled: json["isDisabled"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "pvariationId": pvariationId,
        "value": value,
        "isDisabled": isDisabled,
      };
}

class AllVariationProduct {
  AllVariationProduct({
    this.id,
    this.mproductId,
    this.productName,
    this.model,
    this.variation,
    this.sellingPrice,
    this.stock = 0,
    this.variationformat,
    this.allImages,
  });

  int? id;
  int? mproductId;
  String? productName;
  String? model;
  String? variation;
  int? sellingPrice;
  int stock;
  Variationformat? variationformat;
  List<AllImage>? allImages;

  factory AllVariationProduct.fromJson(Map<String, dynamic> json) => AllVariationProduct(
        id: json["id"],
        mproductId: json["mproductId"],
        productName: json["productName"],
        model: json["model"],
        variation: json["variation"],
        sellingPrice: json["sellingPrice"],
        stock: json["stock"] ?? 0,
        variationformat: Variationformat.fromJson(json["variationformat"]),
        allImages: List<AllImage>.from((json["allImages"] ?? []).map((x) => AllImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mproductId": mproductId,
        "productName": productName,
        "model": model,
        "variation": variation,
        "sellingPrice": sellingPrice,
        "stock": stock,
        "variationformat": variationformat?.toJson(),
        "allImages": List<dynamic>.from((allImages ?? []).map((x) => x.toJson())),
      };
}

class AllImage {
  AllImage({
    this.id,
    this.mproductId,
    this.productId,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? mproductId;
  int? productId;
  String? url;
  dynamic createdAt;
  dynamic updatedAt;

  factory AllImage.fromJson(Map<String, dynamic> json) => AllImage(
        id: json["id"],
        mproductId: json["mproductId"],
        productId: json["productId"],
        url: json["url"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mproductId": mproductId,
        "productId": productId,
        "url": url,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Variationformat {
  Variationformat({this.color});

  String? color;

  factory Variationformat.fromJson(Map<String, dynamic> json) => Variationformat(
        color: json["Color"],
      );

  Map<String, dynamic> toJson() => {
        "Color": color,
      };
}

class Product {
  Product({
    this.id,
    this.orderNo,
    this.slug,
    this.productName,
    this.productImage,
    this.model,
    this.brand,
    this.category,
    this.subcategory,
    this.sellingPrice,
    this.briefDescription,
    this.discountedPrice,
    this.discount,
    this.isNew,
    this.isFeatured,
    this.stock,
    this.isWishlist = false,
    this.rating = 0.0,
    this.reviews,
    this.allImages,
  });

  int? id;
  int? orderNo;
  String? slug;
  String? productName;
  String? productImage;
  String? model;
  String? brand;
  String? category;
  String? subcategory;
  int? sellingPrice;
  String? briefDescription;
  int? discountedPrice;
  int? discount;
  int? isNew;
  int? isFeatured;
  int? stock;
  bool isWishlist;
  double? rating;
  int? reviews;
  List<AllImage>? allImages;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        orderNo: json["order_no"],
        slug: json["slug"],
        productName: json["productName"],
        productImage: json["productImage"],
        model: json["model"],
        brand: json["brand"],
        category: json["category"],
        subcategory: json["subcategory"],
        sellingPrice: json["sellingPrice"],
        briefDescription: json["brief_description"],
        discountedPrice: json["discountedPrice"],
        discount: json["discount"],
        isNew: json["isNew"],
        isFeatured: json["isFeatured"],
        stock: json["stock"],
        isWishlist: json["isWishlist"] ?? false,
        rating: double.parse(json["rating"].toString()),
        reviews: json["reviews"],
        allImages: List<AllImage>.from((json["allImages"] ?? []).map((x) => AllImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_no": orderNo,
        "slug": slug,
        "productName": productName,
        "productImage": productImage,
        "model": model,
        "brand": brand,
        "category": category,
        "subcategory": subcategory,
        "sellingPrice": sellingPrice,
        "brief_description": briefDescription,
        "discountedPrice": discountedPrice,
        "discount": discount,
        "isNew": isNew,
        "isFeatured": isFeatured,
        "stock": stock,
        "isWishlist": isWishlist,
        "rating": rating,
        "reviews": reviews,
        "allImages": List<dynamic>.from((allImages ?? []).map((x) => x.toJson())),
      };
}
