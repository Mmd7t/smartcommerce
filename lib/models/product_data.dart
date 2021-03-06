import 'package:smartcommerce/models/product_submodels.dart';

class ProductData {
  ProductData({
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
  Price specialPrice;
  int wishlist;
  List<DatumTranslation> translations;

  factory ProductData.fromJson(Map<String, dynamic> json) {
    print(json["special_price"]);

    return ProductData(
      id: json["id"],
      name: json["name"],
      shortDescription: json["short_description"],
      baseImage: json["base_image"],
      brandId: json["brand_id"],
      taxClassId: json["tax_class_id"],
      formattedPrice: Price.fromJson(json["formatted_price"] ?? {}),
      sellingPrice: Price.fromJson(json["selling_price"] ?? {}),
      specialPrice: Price.fromJson(json["special_price"] ?? {}),
      wishlist: json["wishlist"],
      translations: List<DatumTranslation>.from(
          json["translations"].map((x) => DatumTranslation.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_description": shortDescription,
        "base_image": baseImage,
        "brand_id": brandId,
        "tax_class_id": taxClassId,
        "formatted_price": formattedPrice.toJson(),
        "selling_price": sellingPrice.toJson(),
        "special_price": specialPrice.toJson(),
        "wishlist": wishlist,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
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
