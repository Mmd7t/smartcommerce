// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:smartcommerce/models/product_submodels.dart';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    this.id,
    this.brandId,
    this.supplierId,
    this.taxClassId,
    this.slug,
    this.price,
    this.specialPrice,
    this.specialPriceType,
    this.specialPriceStart,
    this.specialPriceEnd,
    this.sellingPrice,
    this.sku,
    this.manageStock,
    this.qty,
    this.inStock,
    this.viewed,
    this.isActive,
    this.newFrom,
    this.newTo,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.reviewsCount,
    this.rating,
    this.wishlist,
    this.baseImage,
    this.formattedPrice,
    this.ratingPercent,
    this.isInStock,
    this.isOutOfStock,
    this.isNew,
    this.hasPercentageSpecialPrice,
    this.specialPricePercent,
    this.name,
    this.description,
    this.shortDescription,
    this.translations,
    this.brand,
    this.categories,
    this.taxClass,
    this.tags,
    this.reviews,
    this.attributes,
    this.relatedProducts,
    this.upSellProducts,
    this.crossSellProducts,
    this.options,
    this.meta,
    this.files,
  });

  int id;
  int brandId;
  int supplierId;
  dynamic taxClassId;
  String slug;
  Price price;
  Price specialPrice;
  String specialPriceType;
  dynamic specialPriceStart;
  dynamic specialPriceEnd;
  Price sellingPrice;
  dynamic sku;
  bool manageStock;
  dynamic qty;
  bool inStock;
  int viewed;
  bool isActive;
  dynamic newFrom;
  dynamic newTo;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int reviewsCount;
  dynamic rating;
  int wishlist;
  BaseImage baseImage;
  String formattedPrice;
  int ratingPercent;
  bool isInStock;
  bool isOutOfStock;
  bool isNew;
  bool hasPercentageSpecialPrice;
  dynamic specialPricePercent;
  String name;
  String description;
  dynamic shortDescription;
  List<ProductDetailsModelTranslation> translations;
  Brand brand;
  List<Category> categories;
  TaxClass taxClass;
  List<dynamic> tags;
  List<dynamic> reviews;
  List<dynamic> attributes;
  List<dynamic> relatedProducts;
  List<dynamic> upSellProducts;
  List<dynamic> crossSellProducts;
  List<dynamic> options;
  Meta meta;
  List<BaseImage> files;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json["id"],
        brandId: json["brand_id"],
        supplierId: json["supplier_id"],
        taxClassId: json["tax_class_id"],
        slug: json["slug"],
        price: Price.fromJson(json["price"]),
        specialPrice: json["special_price"] != null
            ? Price.fromJson(json["special_price"])
            : null,
        specialPriceType: json["special_price_type"],
        specialPriceStart: json["special_price_start"],
        specialPriceEnd: json["special_price_end"],
        sellingPrice: Price.fromJson(json["selling_price"]),
        sku: json["sku"],
        manageStock: json["manage_stock"],
        qty: json["qty"],
        inStock: json["in_stock"],
        viewed: json["viewed"],
        isActive: json["is_active"],
        newFrom: json["new_from"],
        newTo: json["new_to"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        reviewsCount: json["reviews_count"],
        rating: json["rating"],
        wishlist: json["wishlist"],
        baseImage: BaseImage.fromJson(json["base_image"]),
        formattedPrice: json["formatted_price"],
        ratingPercent: json["rating_percent"],
        isInStock: json["is_in_stock"],
        isOutOfStock: json["is_out_of_stock"],
        isNew: json["is_new"],
        hasPercentageSpecialPrice: json["has_percentage_special_price"],
        specialPricePercent: json["special_price_percent"],
        name: json["name"],
        description: json["description"],
        shortDescription: json["short_description"],
        translations: List<ProductDetailsModelTranslation>.from(
            json["translations"]
                .map((x) => ProductDetailsModelTranslation.fromJson(x))),
        brand: Brand.fromJson(json["brand"]),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        taxClass: TaxClass.fromJson(json["tax_class"]),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        reviews: json["reviews"] != null
            ? List<dynamic>.from(json["reviews"].map((x) => x))
            : null,
        attributes: (json["attributes"] != null)
            ? List<dynamic>.from(json["attributes"].map((x) => x))
            : null,
        relatedProducts: json["related_products"] != null
            ? List<dynamic>.from(json["related_products"].map((x) => x))
            : null,
        upSellProducts: json["up_sell_products"] != null
            ? List<dynamic>.from(json["up_sell_products"].map((x) => x))
            : null,
        crossSellProducts: json["cross_sell_products"] != null
            ? List<dynamic>.from(json["cross_sell_products"].map((x) => x))
            : null,
        options: List<dynamic>.from(json["options"].map((x) => x)),
        meta: Meta.fromJson(json["meta"]),
        files: List<BaseImage>.from(
            json["files"].map((x) => BaseImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand_id": brandId,
        "supplier_id": supplierId,
        "tax_class_id": taxClassId,
        "slug": slug,
        "price": price.toJson(),
        "special_price": specialPrice,
        "special_price_type": specialPriceType,
        "special_price_start": specialPriceStart,
        "special_price_end": specialPriceEnd,
        "selling_price": sellingPrice.toJson(),
        "sku": sku,
        "manage_stock": manageStock,
        "qty": qty,
        "in_stock": inStock,
        "viewed": viewed,
        "is_active": isActive,
        "new_from": newFrom,
        "new_to": newTo,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "reviews_count": reviewsCount,
        "rating": rating,
        "wishlist": wishlist,
        "base_image": baseImage.toJson(),
        "formatted_price": formattedPrice,
        "rating_percent": ratingPercent,
        "is_in_stock": isInStock,
        "is_out_of_stock": isOutOfStock,
        "is_new": isNew,
        "has_percentage_special_price": hasPercentageSpecialPrice,
        "special_price_percent": specialPricePercent,
        "name": name,
        "description": description,
        "short_description": shortDescription,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
        "brand": brand.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "tax_class": taxClass.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "attributes": List<dynamic>.from(attributes.map((x) => x)),
        "related_products": List<dynamic>.from(relatedProducts.map((x) => x)),
        "up_sell_products": List<dynamic>.from(upSellProducts.map((x) => x)),
        "cross_sell_products":
            List<dynamic>.from(crossSellProducts.map((x) => x)),
        "options": List<dynamic>.from(options.map((x) => x)),
        "meta": meta.toJson(),
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
      };
}

class ReviewResponseModel {
  String message;
  ReviewResponseModel(this.message);

  ReviewResponseModel.fromJson(Map json) {
    message = json['message'];
  }
}
