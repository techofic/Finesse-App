

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.username,
    this.contact,
    this.storeId,
    this.userType,
    this.rememberToken,
    this.isActive,
    this.otpCount,
    required this.createdAt,
    required this.updatedAt,
    required this.customer,
  });

  int? id;
  String? name;
  String? email;
  String? username;
  String? contact;
  dynamic storeId;
  String? userType;
  dynamic rememberToken;
  int? isActive;
  int? otpCount;
  DateTime createdAt;
  DateTime updatedAt;
  Customer customer;

  factory User.fromJson(Map<String?, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        contact: json["contact"],
        storeId: json["store_id"],
        userType: json["userType"],
        rememberToken: json["remember_token"],
        isActive: json["isActive"],
        otpCount: json["otp_count"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        customer: Customer.fromJson(json["customer"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "contact": contact,
        "store_id": storeId,
        "userType": userType,
        "remember_token": rememberToken,
        "isActive": isActive,
        "otp_count": otpCount,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "customer": customer.toJson(),
      };
}

class Customer {
  Customer({
    this.id,
    this.userId,
    this.customerName,
    this.address,
    this.contact,
    this.email,
    this.zone,
    this.facebook,
    this.instagram,
    this.barcode,
    this.cityId,
    this.areaId,
    this.zoneId,
    this.postCode,
    this.opening,
    this.balance,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  int? userId;
  String? customerName;
  dynamic address;
  String? contact;
  String? email;
  dynamic zone;
  String? facebook;
  String? instagram;
  dynamic barcode;
  dynamic cityId;
  dynamic areaId;
  dynamic zoneId;
  dynamic postCode;
  String? opening;
  String? balance;
  DateTime createdAt;
  DateTime updatedAt;

  factory Customer.fromJson(Map<String?, dynamic> json) => Customer(
        id: json["id"],
        userId: json["userId"],
        customerName: json["customerName"],
        address: json["address"],
        contact: json["contact"],
        email: json["email"],
        zone: json["zone"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        barcode: json["barcode"],
        cityId: json["cityId"],
        areaId: json["areaId"],
        zoneId: json["zoneId"],
        postCode: json["postCode"],
        opening: json["opening"],
        balance: json["balance"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "customerName": customerName,
        "address": address,
        "contact": contact,
        "email": email,
        "zone": zone,
        "facebook": facebook,
        "instagram": instagram,
        "barcode": barcode,
        "cityId": cityId,
        "areaId": areaId,
        "zoneId": zoneId,
        "postCode": postCode,
        "opening": opening,
        "balance": balance,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
