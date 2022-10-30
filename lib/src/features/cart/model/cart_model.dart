class CartModel {
  CartModel({
    required this.allCarts,
  });

  List<AllCart> allCarts;

  factory CartModel.fromJson(Map<String?, dynamic> json) =>
      CartModel(
        allCarts: List<AllCart>.from(
            json["allCarts"].map((x) => AllCart.fromJson(x))),
      );

  Map<String?, dynamic> toJson() =>
      {
        "allCarts": List<dynamic>.from(allCarts.map((x) => x.toJson())),
      };
}

class AllCart {
  AllCart({
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
  String?product;
  int? quantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  VproductClass? details;
  Mproduct? mproduct;
  VproductClass? vproduct;

  factory AllCart.fromJson(Map<String?, dynamic> json) =>
      AllCart(
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
        details: VproductClass.fromJson(json["details"]),
        mproduct: Mproduct.fromJson(json["mproduct"]),
        vproduct: VproductClass.fromJson(json["vproduct"]),
      );

  Map<String?, dynamic> toJson() =>
      {
        "id": id,
        "userId": userId,
        "productId": productId,
        "mproductId": mproductId,
        "menuId": menuId,
        "categoryId": categoryId,
        "subcategoryId": subcategoryId,
        "product": product,
        "quantity": quantity,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "details": details,
        "mproduct": mproduct,
        "vproduct": vproduct,
      };
}

class VproductClass {
  VproductClass({
    this.id,
    this.menuId,
    this.groupId,
    this.categoryId,
    this.brandId,
    this.mproductId,
    this.productName,
    this.groupName,
    this.catName,
    this.brand,
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
    required this.createdAt,
    required this.updatedAt,
    this.img,
    this.discount,
    this.quantity,
  });

  int? id;
  int? menuId;
  int? groupId;
  int? categoryId;
  int? brandId;
  int? mproductId;
  String? productName;
  String? groupName;
  String? catName;
  String? brand;
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
  DateTime createdAt;
  DateTime updatedAt;
  String? img;
  int? discount;
  int? quantity;

  factory VproductClass.fromJson(Map<String?, dynamic> json) =>
      VproductClass(
        id: json["id"],
        menuId: json["menuId"],
        groupId: json["groupId"],
        categoryId: json["categoryId"],
        brandId: json["brandId"],
        mproductId: json["mproductId"],
        productName: json["productName"],
        groupName: json["groupName"],
        catName: json["catName"],
        brand: json["brand"],
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        img: json["img"] == null ? null : json["img"],
        discount: json["discount"] == null ? null : json["discount"],
        quantity: json["quantity"] == null ? null : json["quantity"],
      );

  Map<String?, dynamic> toJson() =>
      {
        "id": id,
        "menuId": menuId,
        "groupId": groupId,
        "categoryId": categoryId,
        "brandId": brandId,
        "mproductId": mproductId,
        "productName": productName,
        "groupName": groupName,
        "catName": catName,
        "brand": brand,
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "img": img == null ? null : img,
        "discount": discount == null ? null : discount,
        "quantity": quantity == null ? null : quantity,
      };
}

class Mproduct {
  Mproduct({
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
  });

  int? id;
  int? menuId;
  int? groupId;
  int? categoryId;
  int? brandId;
  String? productName;
  String? model;
  String? description;
  dynamic briefDescription;
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
  MproductDetails details;

  factory Mproduct.fromJson(Map<String?, dynamic> json) =>
      Mproduct(
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
        details: MproductDetails.fromJson(json["details"]),
      );

  Map<String?, dynamic> toJson() =>
      {
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
      };
}

class MproductDetails {
  MproductDetails({
    this.color,
  });

  dynamic color;

  factory MproductDetails.fromJson(Map<String?, dynamic> json) =>
      MproductDetails(
        color: json["Color"],
      );

  Map<String?, dynamic> toJson() =>
      {
        "Color": color,
      };
}
