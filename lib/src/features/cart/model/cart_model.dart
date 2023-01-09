class CartModel {
  CartModel({
    this.id,
    this.userId,
    this.productId,
    this.mproductId,
    this.menuId,
    this.categoryId,
    this.subcategoryId,
    this.product,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.details,
    this.mproduct,
    this.vproduct,
  });

  int? id;
  int? userId;
  int? productId;
  int? mproductId;
  int? menuId;
  int? categoryId;
  int? subcategoryId;
  String? product;
  int? quantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  Details? details;
  Mproduct? mproduct;
  Details? vproduct;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        userId: json["userId"],
        productId: json["productId"],
        mproductId: json["mproductId"],
        menuId: json["menuId"],
        categoryId: json["categoryId"],
        subcategoryId: json["subcategoryId"],
        product: json["product"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        details: Details.fromJson(json["details"]),
        mproduct: Mproduct.fromJson(json["mproduct"]),
        vproduct: Details.fromJson(json["vproduct"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "productId": productId,
        "mproductId": mproductId,
        "menuId": menuId,
        "categoryId": categoryId,
        "subcategoryId": subcategoryId,
        "product": product,
        "quantity": quantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "details": details!.toJson(),
        "mproduct": mproduct!.toJson(),
        "vproduct": vproduct!.toJson(),
      };
}

class Details {
  Details({
    this.id,
    this.menuId,
    this.groupId,
    this.categoryId,
    this.brandId,
    this.mproductId,
    this.productName,
    this.unit,
    this.model,
    this.variation,
    this.sellingPrice,
    this.averageBuyingPrice,
    this.stock,
    this.barCode,
    this.productImage,
    this.images,
    this.date,
    this.openingQuantity,
    this.openingUnitPrice,
    this.isAvailable,
    this.isArchived,
    this.createdAt,
    this.updatedAt,
    this.variationformat,
  });

  int? id;
  int? menuId;
  int? groupId;
  int? categoryId;
  int? brandId;
  int? mproductId;
  String? productName;
  String? unit;
  String? model;
  String? variation;
  int? sellingPrice;
  String? averageBuyingPrice;
  int? stock;
  String? barCode;
  dynamic productImage;
  dynamic images;
  String? date;
  String? openingQuantity;
  String? openingUnitPrice;
  int? isAvailable;
  int? isArchived;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic>? variationformat;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["id"],
        menuId: json["menuId"],
        groupId: json["groupId"],
        categoryId: json["categoryId"],
        brandId: json["brandId"],
        mproductId: json["mproductId"],
        productName: json["productName"],
        unit: json["unit"],
        model: json["model"],
        variation: json["variation"],
        sellingPrice: json["sellingPrice"],
        averageBuyingPrice: json["averageBuyingPrice"],
        stock: json["stock"],
        barCode: json["barCode"],
        productImage: json["productImage"],
        images: json["images"],
        date: json["date"],
        openingQuantity: json["openingQuantity"],
        openingUnitPrice: json["openingUnitPrice"],
        isAvailable: json["isAvailable"],
        isArchived: json["is_archived"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        variationformat: json["variationformat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menuId": menuId,
        "groupId": groupId,
        "categoryId": categoryId,
        "brandId": brandId,
        "mproductId": mproductId,
        "productName": productName,
        "unit": unit,
        "model": model,
        "variation": variation,
        "sellingPrice": sellingPrice,
        "averageBuyingPrice": averageBuyingPrice,
        "stock": stock,
        "barCode": barCode,
        "productImage": productImage,
        "images": images,
        "date": date,
        "openingQuantity": openingQuantity,
        "openingUnitPrice": openingUnitPrice,
        "isAvailable": isAvailable,
        "is_archived": isArchived,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "variationformat": variationformat,
      };
}

// class Variationformat {
//   Variationformat({
//     this.color,
//   });
//
//   String? color;
//
//   factory Variationformat.fromJson(Map<String, dynamic> json) => Variationformat(
//         color: json["Color"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Color": color,
//       };
// }

class Mproduct {
  Mproduct({
    this.id,
    this.slug,
    this.menuId,
    this.groupId,
    this.categoryId,
    this.brandId,
    this.productName,
    this.model,
    this.description,
    this.unit,
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
    this.isArchived,
    this.orderNo,
    this.createdAt,
    this.updatedAt,
    // this.details,
  });

  int? id;
  String? slug;
  int? menuId;
  int? groupId;
  int? categoryId;
  int? brandId;
  String? productName;
  String? model;
  String? description;
  String? unit;
  String? briefDescription;
  int? sellingPrice;
  String? averageBuyingPrice;
  String? productImage;
  dynamic images;
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
  int? isArchived;
  int? orderNo;
  DateTime? createdAt;
  DateTime? updatedAt;
  // Variationformat? details;

  factory Mproduct.fromJson(Map<String, dynamic> json) => Mproduct(
        id: json["id"],
        slug: json["slug"],
        menuId: json["menuId"],
        groupId: json["groupId"],
        categoryId: json["categoryId"],
        brandId: json["brandId"],
        productName: json["productName"],
        model: json["model"],
        description: json["description"],
        unit: json["unit"],
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
        isArchived: json["is_archived"],
        orderNo: json["order_no"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        // details: Variationformat.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "menuId": menuId,
        "groupId": groupId,
        "categoryId": categoryId,
        "brandId": brandId,
        "productName": productName,
        "model": model,
        "description": description,
        "unit": unit,
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
        "is_archived": isArchived,
        "order_no": orderNo,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        // "details": details!.toJson(),
      };
}
