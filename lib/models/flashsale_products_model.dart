// To parse this JSON data, do
//
//     final flashsaleProductsModel = flashsaleProductsModelFromJson(jsonString);

import 'dart:convert';

FlashsaleProductsModel flashsaleProductsModelFromJson(String str) =>
    FlashsaleProductsModel.fromJson(json.decode(str));

String flashsaleProductsModelToJson(FlashsaleProductsModel data) =>
    json.encode(data.toJson());

class FlashsaleProductsModel {
  FlashsaleProductsModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.flashProducts,
    this.campaignName,
    this.translations,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  List<FlashProduct> flashProducts;
  String campaignName;
  List<Translation> translations;

  factory FlashsaleProductsModel.fromJson(Map<String, dynamic> json) =>
      FlashsaleProductsModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        flashProducts: List<FlashProduct>.from(
            json["flashProducts"].map((x) => FlashProduct.fromJson(x))),
        campaignName: json["campaign_name"],
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "flashProducts":
            List<dynamic>.from(flashProducts.map((x) => x.toJson())),
        "campaign_name": campaignName,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
      };
}

class FlashProduct {
  FlashProduct({
    this.id,
    this.name,
    this.shortDescription,
    this.baseImage,
    this.sellingPrice,
    this.rating,
    this.price,
    this.pivot,
    this.qty,
    this.sold,
  });

  int id;
  String name;
  dynamic shortDescription;
  String baseImage;
  Price sellingPrice;
  dynamic rating;
  Price price;
  Pivot pivot;
  dynamic qty;
  int sold;

  factory FlashProduct.fromJson(Map<String, dynamic> json) => FlashProduct(
        id: json["id"],
        name: json["name"],
        shortDescription: json["short_description"],
        baseImage: json["base_image"],
        sellingPrice: Price.fromJson(json["selling_price"]),
        rating: json["rating"],
        price: Price.fromJson(json["price"]),
        pivot: Pivot.fromJson(json["pivot"]),
        qty: json["qty"],
        sold: json["sold"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_description": shortDescription,
        "base_image": baseImage,
        "selling_price": sellingPrice.toJson(),
        "rating": rating,
        "price": price.toJson(),
        "pivot": pivot.toJson(),
        "qty": qty,
        "sold": sold,
      };
}

class Pivot {
  Pivot({
    this.flashSaleId,
    this.productId,
    this.id,
    this.endDate,
    this.price,
    this.qty,
    this.sold,
  });

  int flashSaleId;
  int productId;
  int id;
  DateTime endDate;
  Price price;
  int qty;
  int sold;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        flashSaleId: json["flash_sale_id"],
        productId: json["product_id"],
        id: json["id"],
        endDate: DateTime.parse(json["end_date"]),
        price: Price.fromJson(json["price"]),
        qty: json["qty"],
        sold: json["sold"],
      );

  Map<String, dynamic> toJson() => {
        "flash_sale_id": flashSaleId,
        "product_id": productId,
        "id": id,
        "end_date": endDate.toIso8601String(),
        "price": price.toJson(),
        "qty": qty,
        "sold": sold,
      };
}

class Price {
  Price({
    this.amount,
    this.formatted,
    this.currency,
    this.inCurrentCurrency,
  });

  String amount;
  String formatted;
  String currency;
  InCurrentCurrency inCurrentCurrency;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json["amount"],
        formatted: json["formatted"],
        currency: json["currency"],
        inCurrentCurrency:
            InCurrentCurrency.fromJson(json["inCurrentCurrency"]),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "formatted": formatted,
        "currency": currency,
        "inCurrentCurrency": inCurrentCurrency.toJson(),
      };
}

class InCurrentCurrency {
  InCurrentCurrency({
    this.amount,
    this.formatted,
    this.currency,
  });

  int amount;
  String formatted;
  String currency;

  factory InCurrentCurrency.fromJson(Map<String, dynamic> json) =>
      InCurrentCurrency(
        amount: json["amount"],
        formatted: json["formatted"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "formatted": formatted,
        "currency": currency,
      };
}

class RatingClass {
  RatingClass({
    this.rating,
    this.ratingPercent,
    this.createdAtFormatted,
  });

  int rating;
  int ratingPercent;
  dynamic createdAtFormatted;

  factory RatingClass.fromJson(Map<String, dynamic> json) => RatingClass(
        rating: json["rating"],
        ratingPercent: json["rating_percent"],
        createdAtFormatted: json["created_at_formatted"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "rating_percent": ratingPercent,
        "created_at_formatted": createdAtFormatted,
      };
}

class Translation {
  Translation({
    this.id,
    this.flashSaleId,
    this.locale,
    this.campaignName,
  });

  int id;
  int flashSaleId;
  String locale;
  String campaignName;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        flashSaleId: json["flash_sale_id"],
        locale: json["locale"],
        campaignName: json["campaign_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "flash_sale_id": flashSaleId,
        "locale": locale,
        "campaign_name": campaignName,
      };
}
