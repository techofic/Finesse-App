class ReportModel {
  ReportModel({
    required this.data,
  });

  Data data;

  factory ReportModel.fromJson(Map<String?, dynamic> json) => ReportModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String?, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.total,
    this.perPage,
    this.page,
    this.lastPage,
    required this.data,
  });

  int? total;
  int? perPage;
  int? page;
  int? lastPage;
  List<Datum> data;

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
        total: json["total"],
        perPage: json["perPage"],
        page: json["page"],
        lastPage: json["lastPage"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "total": total,
        "perPage": perPage,
        "page": page,
        "lastPage": lastPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.reason,
    this.orderId,
    this.description,
    this.response,
    this.image,
    this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  int? userId;
  String? reason;
  String? orderId;
  String? description;
  dynamic response;
  String? image;
  String? status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String?, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        reason: json["reason"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        description: json["description"],
        response: json["response"],
        image: json["image"] == null ? null : json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "reason": reason,
        "orderId": orderId == null ? null : orderId,
        "description": description,
        "response": response,
        "image": image == null ? null : image,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
