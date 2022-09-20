class CartModel {
  CartModel({
    required this.allCarts,
  });

  List<AllCart> allCarts;

  factory CartModel.fromJson(Map<String?, dynamic> json) => CartModel(
        allCarts: List<AllCart>.from(
            json["allCarts"].map((x) => AllCart.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
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
    required this.createdAt,
    required this.updatedAt,
    required this.details,
    required this.mproduct,
    required this.vproduct,
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
  DateTime createdAt;
  DateTime updatedAt;
  AllCartDetails details;
  Mproduct mproduct;
  Vproduct vproduct;

  factory AllCart.fromJson(Map<String?, dynamic> json) => AllCart(
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
        details: AllCartDetails.fromJson(json["details"]),
        mproduct: Mproduct.fromJson(json["mproduct"]),
        vproduct: Vproduct.fromJson(json["vproduct"]),
      );

  Map<String?, dynamic> toJson() => {
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
        "details": details.toJson(),
        "mproduct": mproduct.toJson(),
        "vproduct": vproduct.toJson(),
      };
}

class AllCartDetails {
  AllCartDetails({
    this.averageBuyingPrice,
    this.barCode,
    this.brand,
    this.brandId,
    this.catName,
    this.categoryId,
    required this.createdAt,
    this.date,
    this.discount,
    this.groupId,
    this.groupName,
    this.id,
    required this.images,
    this.img,
    this.menuId,
    this.model,
    this.mproductId,
    this.openingQuantity,
    this.openingUnitPrice,
    this.productImage,
    this.productName,
    this.quantity,
    this.sellingPrice,
    this.stock,
    this.unit,
    required this.updatedAt,
    this.variation,
  });

  String? averageBuyingPrice;
  String? barCode;
  String? brand;
  int? brandId;
  String? catName;
  int? categoryId;
  DateTime createdAt;
  String? date;
  int? discount;
  int? groupId;
  String? groupName;
  int? id;
  List<dynamic> images;
  String? img;
  int? menuId;
  String? model;
  int? mproductId;
  String? openingQuantity;
  String? openingUnitPrice;
  dynamic productImage;
  String? productName;
  int? quantity;
  int? sellingPrice;
  int? stock;
  String? unit;
  DateTime updatedAt;
  String? variation;

  factory AllCartDetails.fromJson(Map<String?, dynamic> json) => AllCartDetails(
        averageBuyingPrice: json["averageBuyingPrice"],
        barCode: json["barCode"],
        brand: json["brand"],
        brandId: json["brandId"],
        catName: json["catName"],
        categoryId: json["categoryId"],
        createdAt: DateTime.parse(json["created_at"]),
        date: json["date"],
        discount: json["discount"],
        groupId: json["groupId"],
        groupName: json["groupName"],
        id: json["id"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        img: json["img"],
        menuId: json["menuId"],
        model: json["model"],
        mproductId: json["mproductId"],
        openingQuantity: json["openingQuantity"],
        openingUnitPrice: json["openingUnitPrice"],
        productImage: json["productImage"],
        productName: json["productName"],
        quantity: json["quantity"],
        sellingPrice: json["sellingPrice"],
        stock: json["stock"],
        unit: json["unit"],
        updatedAt: DateTime.parse(json["updated_at"]),
        variation: json["variation"],
      );

  Map<String?, dynamic> toJson() => {
        "averageBuyingPrice": averageBuyingPrice,
        "barCode": barCode,
        "brand": brand,
        "brandId": brandId,
        "catName": catName,
        "categoryId": categoryId,
        "created_at": createdAt,
        "date": date,
        "discount": discount,
        "groupId": groupId,
        "groupName": groupName,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x)),
        "img": img,
        "menuId": menuId,
        "model": model,
        "mproductId": mproductId,
        "openingQuantity": openingQuantity,
        "openingUnitPrice": openingUnitPrice,
        "productImage": productImage,
        "productName": productName,
        "quantity": quantity,
        "sellingPrice": sellingPrice,
        "stock": stock,
        "unit": unit,
        "updated_at": updatedAt,
        "variation": variation,
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

  factory Mproduct.fromJson(Map<String?, dynamic> json) => Mproduct(
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
      };
}

class MproductDetails {
  MproductDetails({
    this.color,
    this.size,
  });

  String? color;
  String? size;

  factory MproductDetails.fromJson(Map<String?, dynamic> json) =>
      MproductDetails(
        color: json["Color"],
        size: json["Size"],
      );

  Map<String?, dynamic> toJson() => {
        "Color": color,
        "Size": size,
      };
}

class Vproduct {
  Vproduct({
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
  String? images;
  String? date;
  String? openingQuantity;
  String? openingUnitPrice;
  DateTime createdAt;
  DateTime updatedAt;

  factory Vproduct.fromJson(Map<String?, dynamic> json) => Vproduct(
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
      );

  Map<String?, dynamic> toJson() => {
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
      };
}
