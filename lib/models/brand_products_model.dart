// To parse this JSON data, do
//
//     final brandProductsModel = brandProductsModelFromJson(jsonString);

import 'dart:convert';

import 'package:smartcommerce/models/product_data.dart';

BrandProductsModel brandProductsModelFromJson(String str) =>
    BrandProductsModel.fromJson(json.decode(str));

String brandProductsModelToJson(BrandProductsModel data) =>
    json.encode(data.toJson());

class BrandProductsModel {
  BrandProductsModel({
    this.id,
    this.name,
    this.translations,
    this.files,
    this.products,
  });

  int id;
  String name;
  List<BrandProductsModelTranslation> translations;
  List<String> files;
  Products products;

  factory BrandProductsModel.fromJson(Map<String, dynamic> json) =>
      BrandProductsModel(
        id: json["id"],
        name: json["name"],
        translations: List<BrandProductsModelTranslation>.from(
            json["translations"]
                .map((x) => BrandProductsModelTranslation.fromJson(x))),
        files: List<String>.from(json["files"].map((x) => x)),
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
        "files": List<dynamic>.from(files.map((x) => x)),
        "products": products.toJson(),
      };
}

class Products {
  Products({
    this.data,
    this.nextPageUrl,
    this.prevPageUrl,
    this.lastPage,
  });

  List<ProductData> data;

  dynamic nextPageUrl;
  dynamic prevPageUrl;
  int lastPage;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: json["data"] != null
            ? List<ProductData>.from(
                json["data"].map((x) => ProductData.fromJson(x)))
            : [],
        nextPageUrl: json["next_page_url"],
        prevPageUrl: json["prev_page_url"],
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "prev_page_url": prevPageUrl,
        "last_page": lastPage,
      };
}
