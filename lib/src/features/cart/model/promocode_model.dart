class PromoCodeModel {
  PromoCodeModel({
    required this.coupon,
    this.discount,
    this.message,
    this.success,
  });

  Coupon coupon;
  int? discount;
  String? message;
  bool? success;

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) => PromoCodeModel(
        coupon: Coupon.fromJson(json["Coupon"]),
        discount: json["discount"],
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "Coupon": coupon.toJson(),
        "discount": discount,
        "message": message,
        "success": success,
      };
}

class Coupon {
  Coupon({
    this.id,
    this.code,
    this.discount,
    this.validity,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? code;
  int? discount;
  DateTime? validity;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        code: json["code"],
        discount: json["discount"],
        validity: DateTime.parse(json["validity"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "discount": discount,
        "validity": validity,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
