// To parse this JSON data, do
//
//     final categoriesParentModel = categoriesParentModelFromJson(jsonString);

import 'dart:convert';

List<CategoriesParentModel> categoriesParentModelFromJson(String str) =>
    List<CategoriesParentModel>.from(
        json.decode(str).map((x) => CategoriesParentModel.fromJson(x)));

String categoriesParentModelToJson(List<CategoriesParentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesParentModel {
  CategoriesParentModel({
    this.id,
    this.parentId,
    this.slug,
    this.position,
    this.isSearchable,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.files,
    this.logo,
    this.banner,
  });

  int id;
  dynamic parentId;
  String slug;
  int position;
  bool isSearchable;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  List<FileElement> files;
  Banner logo;
  Banner banner;

  factory CategoriesParentModel.fromJson(Map<String, dynamic> json) =>
      CategoriesParentModel(
        id: json["id"],
        parentId: json["parent_id"],
        slug: json["slug"],
        position: json["position"],
        isSearchable: json["is_searchable"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
        logo: Banner.fromJson(json["logo"]),
        banner: Banner.fromJson(json["banner"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "slug": slug,
        "position": position,
        "is_searchable": isSearchable,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "logo": logo.toJson(),
        "banner": banner.toJson(),
      };
}

class Banner {
  Banner({
    this.id,
    this.path,
    this.exists,
  });

  int id;
  String path;
  bool exists;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        path: json["path"],
        exists: json["exists"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "exists": exists,
      };
}

class FileElement {
  FileElement({
    this.id,
    this.filename,
    this.path,
  });

  int id;
  String filename;
  String path;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        filename: json["filename"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filename": filename,
        "path": path,
      };
}
