
class CityModel {
  CityModel({
    required this.cities,
  });

  List<City> cities;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
  };
}

class City {
  City({
    this.id,
    this.name,
    this.delivery,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  String? name;
  int? delivery;
  DateTime createdAt;
  DateTime updatedAt;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    delivery: json["delivery"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "delivery": delivery,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
