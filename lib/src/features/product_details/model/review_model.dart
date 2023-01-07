class ReviewModel {
  ReviewModel({
    this.id,
    this.productId,
    this.userId,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int? id;
  int? productId;
  int? userId;
  int? rating;
  String? content;
  dynamic createdAt;
  dynamic updatedAt;
  User? user;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
      id: json["id"],
      productId: json["productId"],
      userId: json["userId"],
      rating: json["rating"],
      content: json["content"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      user: User.fromJson(json["user"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "userId": userId,
        "rating": rating,
        "content": content,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.username,
    this.contact,
    this.storeId,
    this.image,
    this.deviceTokens,
    this.userType,
    this.employeeId,
    this.passportNo,
    this.nationalId,
    this.userRoleId,
    this.rememberToken,
    this.isActive,
    this.otpCount,
    this.bkashAgreementid,
    this.isArchived,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  String? username;
  String? contact;
  int? storeId;
  String? image;
  dynamic deviceTokens;
  String? userType;
  dynamic employeeId;
  dynamic passportNo;
  dynamic nationalId;
  dynamic userRoleId;
  dynamic rememberToken;
  int? isActive;
  int? otpCount;
  dynamic bkashAgreementid;
  int? isArchived;
  dynamic createdAt;
  dynamic updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        contact: json["contact"],
        storeId: json["store_id"],
        image: json["image"],
        deviceTokens: json["deviceTokens"],
        userType: json["userType"],
        employeeId: json["employee_id"],
        passportNo: json["passport_no"],
        nationalId: json["national_id"],
        userRoleId: json["user_role_id"],
        rememberToken: json["remember_token"],
        isActive: json["isActive"],
        otpCount: json["otp_count"],
        bkashAgreementid: json["bkashAgreementid"],
        isArchived: json["is_archived"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "contact": contact,
        "store_id": storeId,
        "image": image,
        "deviceTokens": deviceTokens,
        "userType": userType,
        "employee_id": employeeId,
        "passport_no": passportNo,
        "national_id": nationalId,
        "user_role_id": userRoleId,
        "remember_token": rememberToken,
        "isActive": isActive,
        "otp_count": otpCount,
        "bkashAgreementid": bkashAgreementid,
        "is_archived": isArchived,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
