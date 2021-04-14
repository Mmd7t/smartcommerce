// To parse this JSON data, do
//
//     final brandsModel = brandsModelFromJson(jsonString);

import 'dart:convert';

List<BrandsModel> brandsModelFromJson(String str) => List<BrandsModel>.from(
    json.decode(str).map((x) => BrandsModel.fromJson(x)));

String brandsModelToJson(List<BrandsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrandsModel {
  BrandsModel({
    this.id,
    this.name,
    this.translations,
    this.files,
  });

  int id;
  String name;
  List<Translation> translations;
  List<String> files;

  factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
        id: json["id"],
        name: json["name"],
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
        files: List<String>.from(json["files"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
        "files": List<dynamic>.from(files.map((x) => x)),
      };
}

class Translation {
  Translation({
    this.locale,
    this.name,
  });

  Locale locale;
  String name;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        locale: localeValues.map[json["locale"]],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "locale": localeValues.reverse[locale],
        "name": name,
      };
}

enum Locale { AR }

final localeValues = EnumValues({"ar": Locale.AR});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
