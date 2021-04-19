// To parse this JSON data, do
//
//     final featuredCatsProductsModel = featuredCatsProductsModelFromJson(jsonString);

import 'dart:convert';

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

  List<Datum> data;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.shortDescription,
    this.categoryId,
    this.baseImage,
    this.brandId,
    this.taxClassId,
    this.formattedPrice,
    this.sellingPrice,
    this.specialPrice,
    this.wishlist,
    this.translations,
  });

  int id;
  String name;
  dynamic shortDescription;
  String categoryId;
  String baseImage;
  int brandId;
  dynamic taxClassId;
  Price formattedPrice;
  Price sellingPrice;
  Price specialPrice;
  int wishlist;
  List<Translation> translations;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        shortDescription: json["short_description"],
        categoryId: json["category_id"],
        baseImage: json["base_image"],
        brandId: json["brand_id"] == null ? null : json["brand_id"],
        taxClassId: json["tax_class_id"],
        formattedPrice: Price.fromJson(json["formatted_price"]),
        sellingPrice: Price.fromJson(json["selling_price"]),
        specialPrice: json["special_price"] == null
            ? null
            : Price.fromJson(json["special_price"]),
        wishlist: json["wishlist"],
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_description": shortDescription,
        "category_id": categoryId,
        "base_image": baseImage,
        "brand_id": brandId == null ? null : brandId,
        "tax_class_id": taxClassId,
        "formatted_price": formattedPrice.toJson(),
        "selling_price": sellingPrice.toJson(),
        "special_price": specialPrice == null ? null : specialPrice.toJson(),
        "wishlist": wishlist,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
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
  Currency currency;
  InCurrentCurrency inCurrentCurrency;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json["amount"],
        formatted: json["formatted"],
        currency: currencyValues.map[json["currency"]],
        inCurrentCurrency:
            InCurrentCurrency.fromJson(json["inCurrentCurrency"]),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "formatted": formatted,
        "currency": currencyValues.reverse[currency],
        "inCurrentCurrency": inCurrentCurrency.toJson(),
      };
}

enum Currency { EGP }

final currencyValues = EnumValues({"EGP": Currency.EGP});

class InCurrentCurrency {
  InCurrentCurrency({
    this.amount,
    this.formatted,
    this.currency,
  });

  String amount;
  String formatted;
  Currency currency;

  factory InCurrentCurrency.fromJson(Map<String, dynamic> json) =>
      InCurrentCurrency(
        amount: json["amount"].toString(),
        formatted: json["formatted"],
        currency: currencyValues.map[json["currency"]],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "formatted": formatted,
        "currency": currencyValues.reverse[currency],
      };
}

class Translation {
  Translation({
    this.locale,
    this.name,
    this.shortDescription,
  });

  Locale locale;
  String name;
  dynamic shortDescription;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        locale: localeValues.map[json["locale"]],
        name: json["name"],
        shortDescription: json["short_description"],
      );

  Map<String, dynamic> toJson() => {
        "locale": localeValues.reverse[locale],
        "name": name,
        "short_description": shortDescription,
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
