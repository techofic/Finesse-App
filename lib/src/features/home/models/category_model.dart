class CategoryModel {
  CategoryModel({
    required this.groups,
  });

  List<Group> groups;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(
        groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
      };
}

class Group {
  Group({
    this.id,
    this.menuId,
    this.groupName,
    this.discount,
    required this.category,
    required this.meta,
  });

  int? id;
  int? menuId;
  String? groupName;
  int? discount;
  List<Category> category;
  Meta meta;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        menuId: json["menuId"],
        groupName: json["groupName"],
        discount: json["discount"],
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        meta: Meta.fromJson(json["__meta__"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menuId": menuId,
        "groupName": groupName,
        "discount": discount,
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "__meta__": meta.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.catName,
    this.menuId,
    this.groupId,
    this.isFeatured,
    this.isMenuFeatured,
    required this.meta,
  });

  int? id;
  String? catName;
  int? menuId;
  int? groupId;
  int? isFeatured;
  int? isMenuFeatured;
  Meta meta;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        catName: json["catName"],
        menuId: json["menuId"],
        groupId: json["group_id"],
        isFeatured: json["isFeatured"],
        isMenuFeatured: json["isMenuFeatured"],
        meta: Meta.fromJson(json["__meta__"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "catName": catName,
        "menuId": menuId,
        "group_id": groupId,
        "isFeatured": isFeatured,
        "isMenuFeatured": isMenuFeatured,
        "__meta__": meta.toJson(),
      };
}

class Meta {
  Meta({
    required this.productsCount,
  });

  int productsCount;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        productsCount: json["products_count"],
      );

  Map<String, dynamic> toJson() => {
        "products_count": productsCount,
      };
}
