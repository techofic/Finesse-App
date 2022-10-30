class VoucherCodeModel {
  VoucherCodeModel({
    required this.coupon,
    this.amount,
    this.message,
    this.success,
  });

  Coupon coupon;
  int? amount;
  String? message;
  bool? success;

  factory VoucherCodeModel.fromJson(Map<String, dynamic> json) =>
      VoucherCodeModel(
        coupon: Coupon.fromJson(json["Coupon"]),
        amount: json["amount"],
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "Coupon": coupon.toJson(),
        "amount": amount,
        "message": message,
        "success": success,
      };
}

class Coupon {
  Coupon({
    this.id,
    this.code,
    this.amount,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? code;
  int? amount;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        code: json["code"],
        amount: json["amount"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "amount": amount,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
