import 'dart:convert';

import 'package:smartcommerce/models/product_submodels.dart';

MiniProduct productDetailsModelFromJson(String str) =>
    MiniProduct.fromJson(json.decode(str));

String productDetailsModelToJson(MiniProduct data) =>
    json.encode(data.toJson());

class MiniProduct {
  MiniProduct({
    this.price,
    this.specialPrice,
    this.sellingPrice,
    this.manageStock,
    this.qty,
    this.inStock,
  });

  Price price;
  Price specialPrice;

  Price sellingPrice;
  bool manageStock;
  int qty;
  bool inStock;

  factory MiniProduct.fromJson(Map<String, dynamic> json) => MiniProduct(
        price: Price.fromJson(json["price"]),
        specialPrice: json["special_price"] != null
            ? Price.fromJson(json["special_price"])
            : null,
        sellingPrice: Price.fromJson(json["selling_price"]),
        manageStock: json["manage_stock"] ?? false,
        qty: json["qty"] ?? 0,
        inStock: json["in_stock"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "price": price.toJson(),
        "special_price": specialPrice,
        "selling_price": sellingPrice.toJson(),
        "manage_stock": manageStock,
        "qty": qty,
        "in_stock": inStock,
      };
}
