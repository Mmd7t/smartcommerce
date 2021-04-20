// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

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
  dynamic specialPrice;
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
        specialPrice: json["special_price"],
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
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
        relatedProducts:
            List<dynamic>.from(json["related_products"].map((x) => x)),
        upSellProducts:
            List<dynamic>.from(json["up_sell_products"].map((x) => x)),
        crossSellProducts:
            List<dynamic>.from(json["cross_sell_products"].map((x) => x)),
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

class BaseImage {
  BaseImage({
    this.id,
    this.filename,
    this.path,
  });

  int id;
  String filename;
  String path;

  factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
        id: json["id"],
        filename: json["filename"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filename": filename,
        "path": path,
      };
}

class Brand {
  Brand({
    this.id,
    this.slug,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.translations,
    this.files,
  });

  int id;
  String slug;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  List<BrandTranslation> translations;
  List<BaseImage> files;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        slug: json["slug"],
        isActive: json["is_active"],
        createdAt: (json["created_at"] == null)
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        translations: List<BrandTranslation>.from(
            json["translations"].map((x) => BrandTranslation.fromJson(x))),
        files: List<BaseImage>.from(
            json["files"].map((x) => BaseImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
      };
}

class BrandTranslation {
  BrandTranslation({
    this.id,
    this.brandId,
    this.locale,
    this.name,
  });

  int id;
  int brandId;
  String locale;
  String name;

  factory BrandTranslation.fromJson(Map<String, dynamic> json) =>
      BrandTranslation(
        id: json["id"],
        brandId: json["brand_id"],
        locale: json["locale"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand_id": brandId,
        "locale": locale,
        "name": name,
      };
}

class Category {
  Category({
    this.id,
    this.parentId,
    this.slug,
    this.position,
    this.isSearchable,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.pivot,
  });

  int id;
  int parentId;
  String slug;
  int position;
  bool isSearchable;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  Pivot pivot;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        slug: json["slug"],
        position: json["position"],
        isSearchable: json["is_searchable"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId == null ? null : parentId,
        "slug": slug,
        "position": position,
        "is_searchable": isSearchable,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    this.productId,
    this.categoryId,
  });

  int productId;
  int categoryId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json["product_id"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "category_id": categoryId,
      };
}

class Meta {
  Meta({
    this.id,
    this.entityType,
    this.entityId,
    this.createdAt,
    this.updatedAt,
    this.metaTitle,
    this.metaDescription,
    this.translations,
  });

  int id;
  String entityType;
  int entityId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic metaTitle;
  dynamic metaDescription;
  List<MetaTranslation> translations;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        id: json["id"],
        entityType: json["entity_type"],
        entityId: json["entity_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        translations: List<MetaTranslation>.from(
            json["translations"].map((x) => MetaTranslation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "entity_type": entityType,
        "entity_id": entityId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
      };
}

class MetaTranslation {
  MetaTranslation({
    this.id,
    this.metaDataId,
    this.locale,
    this.metaTitle,
    this.metaDescription,
  });

  int id;
  int metaDataId;
  String locale;
  dynamic metaTitle;
  dynamic metaDescription;

  factory MetaTranslation.fromJson(Map<String, dynamic> json) =>
      MetaTranslation(
        id: json["id"],
        metaDataId: json["meta_data_id"],
        locale: json["locale"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meta_data_id": metaDataId,
        "locale": locale,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
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

  String amount;
  String formatted;
  String currency;

  factory InCurrentCurrency.fromJson(Map<String, dynamic> json) =>
      InCurrentCurrency(
        amount: json["amount"].toString(),
        formatted: json["formatted"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "formatted": formatted,
        "currency": currency,
      };
}

class TaxClass {
  TaxClass({
    this.label,
    this.translations,
  });

  dynamic label;
  List<dynamic> translations;

  factory TaxClass.fromJson(Map<String, dynamic> json) => TaxClass(
        label: json["label"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "translations": List<dynamic>.from(translations.map((x) => x)),
      };
}

class ProductDetailsModelTranslation {
  ProductDetailsModelTranslation({
    this.id,
    this.productId,
    this.locale,
    this.name,
    this.description,
    this.shortDescription,
  });

  int id;
  int productId;
  String locale;
  String name;
  String description;
  dynamic shortDescription;

  factory ProductDetailsModelTranslation.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModelTranslation(
        id: json["id"],
        productId: json["product_id"],
        locale: json["locale"],
        name: json["name"],
        description: json["description"],
        shortDescription: json["short_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "locale": locale,
        "name": name,
        "description": description,
        "short_description": shortDescription,
      };
}
