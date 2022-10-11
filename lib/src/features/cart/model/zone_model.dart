class ZoneModel {
  ZoneModel({
    required this.zones,
  });

  List<Zone> zones;

  factory ZoneModel.fromJson(Map<String, dynamic> json) => ZoneModel(
        zones: List<Zone>.from(json["zones"].map((x) => Zone.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "zones": List<dynamic>.from(zones.map((x) => x.toJson())),
      };
}

class Zone {
  Zone({
    this.id,
    this.cityId,
    this.zoneName,
    this.delivery,
    this.postCode,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? cityId;
  String? zoneName;
  int? delivery;
  dynamic postCode;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        id: json["id"],
        cityId: json["city_id"],
        zoneName: json["zoneName"],
        delivery: json["delivery"],
        postCode: json["postCode"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city_id": cityId,
        "zoneName": zoneName,
        "delivery": delivery,
        "postCode": postCode,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
