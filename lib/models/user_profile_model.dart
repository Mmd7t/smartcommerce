// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.birthday,
    this.savedCoupons,
    this.lastLogin,
    this.reviewsCount,
    this.wishlist,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  dynamic gender;
  dynamic birthday;
  int savedCoupons;
  DateTime lastLogin;
  int reviewsCount;
  List<Wishlist> wishlist;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        gender: json["gender"],
        birthday: json["birthday"],
        savedCoupons: json["saved_coupons"],
        lastLogin: DateTime.parse(json["last_login"]),
        reviewsCount: json["reviews_count"],
        wishlist: List<Wishlist>.from(
            json["wishlist"].map((x) => Wishlist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gender": gender,
        "birthday": birthday,
        "saved_coupons": savedCoupons,
        "last_login": lastLogin.toIso8601String(),
        "reviews_count": reviewsCount,
        "wishlist": List<dynamic>.from(wishlist.map((x) => x.toJson())),
      };
}

class Wishlist {
  Wishlist({
    this.id,
    this.name,
    this.shortDescription,
    this.baseImage,
    this.brandId,
    this.taxClassId,
    this.sellingPrice,
    this.price,
    this.translations,
  });

  int id;
  String name;
  dynamic shortDescription;
  String baseImage;
  int brandId;
  dynamic taxClassId;
  Price sellingPrice;
  Price price;
  List<Translation> translations;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"],
        name: json["name"],
        shortDescription: json["short_description"],
        baseImage: json["base_image"],
        brandId: json["brand_id"] == null ? null : json["brand_id"],
        taxClassId: json["tax_class_id"],
        sellingPrice: Price.fromJson(json["selling_price"]),
        price: Price.fromJson(json["price"]),
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_description": shortDescription,
        "base_image": baseImage,
        "brand_id": brandId == null ? null : brandId,
        "tax_class_id": taxClassId,
        "selling_price": sellingPrice.toJson(),
        "price": price.toJson(),
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

  double amount;
  String formatted;
  Currency currency;

  factory InCurrentCurrency.fromJson(Map<String, dynamic> json) =>
      InCurrentCurrency(
        amount: json["amount"].toDouble(),
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
