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

enum Locale { AR, EN }

final localeValues = EnumValues({"ar": Locale.AR, "en": Locale.EN});

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
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: (json["updated_at"] == null)
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
        name: json["name"],
        translations: List<BrandTranslation>.from(
            json["translations"].map((x) => BrandTranslation.fromJson(x))),
        files: json["files"] != null
            ? List<BaseImage>.from(
                json["files"].map((x) => BaseImage.fromJson(x)))
            : <BaseImage>[],
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
        endDate: json["end_date"] != null
            ? DateTime.tryParse(json["end_date"])
            : null,
        price: json["price"] != null ? Price.fromJson(json["price"]) : null,
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
