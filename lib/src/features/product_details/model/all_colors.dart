class ColorModel {
  ColorModel({
    required this.values,
  });

  List<Value> values;

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    this.pvariationId,
    this.value,
  });

  int? pvariationId;
  String? value;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        pvariationId: json["pvariationId"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "pvariationId": pvariationId,
        "value": value,
      };
}
