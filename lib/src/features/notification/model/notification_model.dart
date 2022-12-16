class NotificationModel {
  NotificationModel({
    required this.notiDetails,
  });

  List<NotiDetail> notiDetails;

  factory NotificationModel.fromJson(Map<String?, dynamic> json) =>
      NotificationModel(
        notiDetails: List<NotiDetail>.from(
            json["notiDetails"].map((x) => NotiDetail.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "notiDetails": List<dynamic>.from(notiDetails.map((x) => x.toJson())),
      };
}

class NotiDetail {
  NotiDetail({
    this.id,
    this.userId,
    this.orderId,
    this.title,
    this.msg,
    this.seen,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  int? userId;
  int? orderId;
  String? title;
  String? msg;
  int? seen;
  DateTime createdAt;
  DateTime updatedAt;

  factory NotiDetail.fromJson(Map<String?, dynamic> json) => NotiDetail(
        id: json["id"],
        userId: json["userId"],
        orderId: json["orderId"],
        title: json["title"],
        msg: json["msg"],
        seen: json["seen"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "orderId": orderId,
        "title": title,
        "msg": msg,
        "seen": seen,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
