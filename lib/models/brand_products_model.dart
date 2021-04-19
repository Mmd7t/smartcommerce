// To parse this JSON data, do
//
//     final brandProductsModel = brandProductsModelFromJson(jsonString);

import 'dart:convert';

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

  List<Datum> data;
  dynamic nextPageUrl;
  dynamic prevPageUrl;
  int lastPage;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
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

class Datum {
  Datum({
    this.id,
    this.name,
    this.shortDescription,
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
  String baseImage;
  int brandId;
  dynamic taxClassId;
  Price formattedPrice;
  Price sellingPrice;
  dynamic specialPrice;
  int wishlist;
  List<DatumTranslation> translations;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        shortDescription: json["short_description"],
        baseImage: json["base_image"],
        brandId: json["brand_id"],
        taxClassId: json["tax_class_id"],
        formattedPrice: Price.fromJson(json["formatted_price"]),
        sellingPrice: Price.fromJson(json["selling_price"]),
        specialPrice: json["special_price"],
        wishlist: json["wishlist"],
        translations: List<DatumTranslation>.from(
            json["translations"].map((x) => DatumTranslation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_description": shortDescription,
        "base_image": baseImage,
        "brand_id": brandId,
        "tax_class_id": taxClassId,
        "formatted_price": formattedPrice.toJson(),
        "selling_price": sellingPrice.toJson(),
        "special_price": specialPrice,
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

  double amount;
  String formatted;
  String currency;

  factory InCurrentCurrency.fromJson(Map<String, dynamic> json) =>
      InCurrentCurrency(
        amount: json["amount"].toDouble(),
        formatted: json["formatted"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "formatted": formatted,
        "currency": currency,
      };
}

class DatumTranslation {
  DatumTranslation({
    this.locale,
    this.name,
    this.shortDescription,
  });

  String locale;
  String name;
  dynamic shortDescription;

  factory DatumTranslation.fromJson(Map<String, dynamic> json) =>
      DatumTranslation(
        locale: json["locale"],
        name: json["name"],
        shortDescription: json["short_description"],
      );

  Map<String, dynamic> toJson() => {
        "locale": locale,
        "name": name,
        "short_description": shortDescription,
      };
}

class BrandProductsModelTranslation {
  BrandProductsModelTranslation({
    this.locale,
    this.name,
  });

  String locale;
  String name;

  factory BrandProductsModelTranslation.fromJson(Map<String, dynamic> json) =>
      BrandProductsModelTranslation(
        locale: json["locale"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "locale": locale,
        "name": name,
      };
}
