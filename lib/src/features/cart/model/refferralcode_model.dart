class ReferralCodeModel {
  ReferralCodeModel({
    this.coupon,
    this.discount,
    this.message,
    this.success,
  });

  int? coupon;
  String? discount;
  String? message;
  bool? success;

  factory ReferralCodeModel.fromJson(Map<String, dynamic> json) =>
      ReferralCodeModel(
        coupon: json["Coupon"],
        discount: json["discount"],
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "Coupon": coupon,
        "discount": discount,
        "message": message,
        "success": success,
      };
}
