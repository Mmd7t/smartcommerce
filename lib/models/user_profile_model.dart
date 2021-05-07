// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

import 'package:smartcommerce/models/product_submodels.dart';

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
    this.wishList,
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
  List<Wishlist> wishList;

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
        wishList: List<Wishlist>.from(
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
        "wishlist": List<dynamic>.from(wishList.map((x) => x.toJson())),
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
