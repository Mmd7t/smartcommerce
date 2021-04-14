class CategoriesModel {
  CategoriesModel({
    this.the0,
    this.id,
    this.parentId,
    this.name,
    this.position,
    this.isSearchable,
    this.isActive,
    this.logo,
    this.banner,
  });

  The0 the0;
  int id;
  dynamic parentId;
  String name;
  int position;
  bool isSearchable;
  bool isActive;
  String logo;
  String banner;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        the0: The0.fromJson(json["0"]),
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
        position: json["position"],
        isSearchable: json["is_searchable"],
        isActive: json["is_active"],
        logo: json["logo"],
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0.toJson(),
        "id": id,
        "parent_id": parentId,
        "name": name,
        "position": position,
        "is_searchable": isSearchable,
        "is_active": isActive,
        "logo": logo,
        "banner": banner,
      };
}

class The0 {
  The0({
    this.locale,
    this.name,
  });

  String locale;
  String name;

  factory The0.fromJson(Map<String, dynamic> json) => The0(
        locale: json["locale"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {"locale": locale, "name": name};
}
