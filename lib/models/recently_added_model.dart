// To parse this JSON data, do
//
//     final recentlyAddedModel = recentlyAddedModelFromJson(jsonString);

import 'dart:convert';

import 'package:smartcommerce/models/product_data.dart';

RecentlyAddedModel recentlyAddedModelFromJson(String str) =>
    RecentlyAddedModel.fromJson(json.decode(str));

String recentlyAddedModelToJson(RecentlyAddedModel data) =>
    json.encode(data.toJson());

class RecentlyAddedModel {
  RecentlyAddedModel({
    this.products,
  });

  Products products;

  factory RecentlyAddedModel.fromJson(Map<String, dynamic> json) =>
      RecentlyAddedModel(
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "products": products.toJson(),
      };
}

class Products {
  Products({
    this.data,
  });

  List<ProductData> data;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: List<ProductData>.from(
            json["data"].map((x) => ProductData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
