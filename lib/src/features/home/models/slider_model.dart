// class HomeSliderModelModel {
//   HomeSliderModelModel({
//     this.success,
//     this.mainSlider,
//   });
//
//   bool? success;
//   List<MainSlider>? mainSlider;
//
//   factory HomeSliderModelModel.fromJson(Map<String, dynamic> json) =>
//       HomeSliderModelModel(
//         success: json["success"],
//         mainSlider: List<MainSlider>.from(
//             json["mainSlider"].map((x) => MainSlider.fromJson(x),),),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "success": success,
//
//          "mainSlider": List<dynamic>.from(mainSlider!.map((x) => x.toJson())),
//       };
// }
//
// class MainSlider {
//   MainSlider({
//     this.id,
//     this.image,
//     this.createdAt,
//   });
//
//   int? id;
//   String? image;
//   DateTime? createdAt;
//
//   factory MainSlider.fromJson(Map<String, dynamic> json) => MainSlider(
//         id: json["id"],
//         image: json["image"],
//         createdAt: DateTime.parse(json["created_at"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "image": image,
//         "created_at": createdAt!.toIso8601String(),
//       };
// }

// To parse this JSON data, do
//
//     final HomeSliderModel = HomeSliderModelFromJson(jsonString);

class HomeSliderModel {
  HomeSliderModel({
    required this.mainSlider,
    required this.popularSubCategory,
    required this.middleBanner,
  });

  List<MainSlider> mainSlider;
  List<PopularSubCategory> popularSubCategory;
  List<MainSlider> middleBanner;

  factory HomeSliderModel.fromJson(Map<String, dynamic> json) =>
      HomeSliderModel(
        mainSlider: List<MainSlider>.from(
            json["mainSlider"].map((x) => MainSlider.fromJson(x))),
        popularSubCategory: List<PopularSubCategory>.from(
            json["popularSubCategory"]
                .map((x) => PopularSubCategory.fromJson(x))),
        middleBanner: List<MainSlider>.from(
            json["middleBanner"].map((x) => MainSlider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mainSlider": List<dynamic>.from(mainSlider.map((x) => x.toJson())),
        "popularSubCategory":
            List<dynamic>.from(popularSubCategory.map((x) => x.toJson())),
        "middleBanner": List<dynamic>.from(middleBanner.map((x) => x.toJson())),
      };
}

class MainSlider {
  MainSlider({
    required this.id,
    required this.image,
  });

  int id;
  String image;

  factory MainSlider.fromJson(Map<String, dynamic> json) => MainSlider(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class PopularSubCategory {
  PopularSubCategory({
    this.id,
    this.catName,
  });

  int? id;
  String? catName;

  factory PopularSubCategory.fromJson(Map<String, dynamic> json) =>
      PopularSubCategory(
        id: json["id"],
        catName: json["catName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "catName": catName,
      };
}
