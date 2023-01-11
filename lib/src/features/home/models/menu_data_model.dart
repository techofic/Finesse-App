class MenuDataModel {
  MenuDataModel({
    this.id,
    this.name,
    this.isActive,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.categories,
  });

  int? id;
  String? name;
  int? isActive;
  dynamic content;
  dynamic createdAt;
  dynamic updatedAt;
  List<Category?>? categories;

  factory MenuDataModel.fromJson(Map<String, dynamic> json) => MenuDataModel(
        id: json["id"],
        name: json["name"],
        isActive: json["isActive"],
        content: json["content"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        categories: json["categories"] == null ? [] : List<Category?>.from(json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "content": content,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x!.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.menuId,
    this.groupName,
    this.discount,
    this.createdAt,
    this.updatedAt,
    this.subcategories,
  });

  int? id;
  int? menuId;
  String? groupName;
  int? discount;
  dynamic createdAt;
  dynamic updatedAt;
  List<Subcategory?>? subcategories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        menuId: json["menuId"],
        groupName: json["groupName"],
        discount: json["discount"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        subcategories: json["subcategories"] == null ? [] : List<Subcategory?>.from(json["subcategories"]!.map((x) => Subcategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menuId": menuId,
        "groupName": groupName,
        "discount": discount,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "subcategories": subcategories == null ? [] : List<dynamic>.from(subcategories!.map((x) => x!.toJson())),
      };
}

class Subcategory {
  Subcategory({
    this.id,
    this.catName,
    this.menuId,
    this.groupId,
    this.isFeatured,
    this.isMenuFeatured,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? catName;
  int? menuId;
  int? groupId;
  int? isFeatured;
  int? isMenuFeatured;
  String? image;
  dynamic createdAt;
  dynamic updatedAt;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        catName: json["catName"],
        menuId: json["menuId"],
        groupId: json["group_id"],
        isFeatured: json["isFeatured"],
        isMenuFeatured: json["isMenuFeatured"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "catName": catName,
        "menuId": menuId,
        "group_id": groupId,
        "isFeatured": isFeatured,
        "isMenuFeatured": isMenuFeatured,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
