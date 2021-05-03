// To parse this JSON data, do
//
//     final staticPagesModel = staticPagesModelFromJson(jsonString);

import 'dart:convert';

List<StaticPagesModel> staticPagesModelFromJson(String str) =>
    List<StaticPagesModel>.from(
        json.decode(str).map((x) => StaticPagesModel.fromJson(x)));

String staticPagesModelToJson(List<StaticPagesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StaticPagesModel {
  StaticPagesModel({
    this.id,
    this.slug,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.body,
    this.translations,
  });

  int id;
  String slug;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String body;
  List<Translation> translations;

  factory StaticPagesModel.fromJson(Map<String, dynamic> json) =>
      StaticPagesModel(
        id: json["id"],
        slug: json["slug"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        body: json["body"],
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "body": body,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
      };
}

class Translation {
  Translation({
    this.id,
    this.pageId,
    this.locale,
    this.name,
    this.body,
  });

  int id;
  int pageId;
  String locale;
  String name;
  String body;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        pageId: json["page_id"],
        locale: json["locale"],
        name: json["name"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "page_id": pageId,
        "locale": locale,
        "name": name,
        "body": body,
      };
}
