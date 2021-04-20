// To parse this JSON data, do
//
//     final featuredCatsProductsModel = featuredCatsProductsModelFromJson(jsonString);

import 'dart:convert';

import 'package:smartcommerce/models/product_data.dart';

FeaturedCatsProductsModel featuredCatsProductsModelFromJson(String str) =>
    FeaturedCatsProductsModel.fromJson(json.decode(str));

String featuredCatsProductsModelToJson(FeaturedCatsProductsModel data) =>
    json.encode(data.toJson());

class FeaturedCatsProductsModel {
  FeaturedCatsProductsModel({
    this.products,
  });

  Products products;

  factory FeaturedCatsProductsModel.fromJson(Map<String, dynamic> json) =>
      FeaturedCatsProductsModel(
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
        data: json["data"] != null
            ? List<ProductData>.from(
                json["data"].map((x) => ProductData.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

