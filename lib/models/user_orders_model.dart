// To parse this JSON data, do
//
//     final userOrdersModel = userOrdersModelFromJson(jsonString);

import 'dart:convert';

List<UserOrdersModel> userOrdersModelFromJson(String str) =>
    List<UserOrdersModel>.from(
        json.decode(str).map((x) => UserOrdersModel.fromJson(x)));

String userOrdersModelToJson(List<UserOrdersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserOrdersModel {
  UserOrdersModel({
    this.id,
    this.customerId,
    this.customerEmail,
    this.customerPhone,
    this.customerFirstName,
    this.customerLastName,
    this.billingFirstName,
    this.billingLastName,
    this.billingAddress1,
    this.billingAddress2,
    this.billingCity,
    this.billingState,
    this.billingZip,
    this.billingCountry,
    this.shippingFirstName,
    this.shippingLastName,
    this.shippingAddress1,
    this.shippingAddress2,
    this.shippingCity,
    this.shippingState,
    this.shippingZip,
    this.shippingCountry,
    this.subTotal,
    this.shippingMethod,
    this.shippingCost,
    this.couponId,
    this.discount,
    this.total,
    this.paymentMethod,
    this.currency,
    this.currencyRate,
    this.locale,
    this.status,
    this.mobileToken,
    this.note,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int customerId;
  CustomerEmail customerEmail;
  String customerPhone;
  StName customerFirstName;
  StName customerLastName;
  StName billingFirstName;
  StName billingLastName;
  String billingAddress1;
  dynamic billingAddress2;
  String billingCity;
  String billingState;
  String billingZip;
  dynamic billingCountry;
  StName shippingFirstName;
  StName shippingLastName;
  String shippingAddress1;
  dynamic shippingAddress2;
  String shippingCity;
  String shippingState;
  String shippingZip;
  dynamic shippingCountry;
  Discount subTotal;
  String shippingMethod;
  Discount shippingCost;
  int couponId;
  Discount discount;
  Discount total;
  String paymentMethod;
  Currency currency;
  String currencyRate;
  Locale locale;
  Status status;
  String mobileToken;
  dynamic note;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserOrdersModel.fromJson(Map<String, dynamic> json) =>
      UserOrdersModel(
        id: json["id"],
        customerId: json["customer_id"],
        customerEmail: customerEmailValues.map[json["customer_email"]],
        customerPhone: json["customer_phone"],
        customerFirstName: stNameValues.map[json["customer_first_name"]],
        customerLastName: stNameValues.map[json["customer_last_name"]],
        billingFirstName: stNameValues.map[json["billing_first_name"]],
        billingLastName: stNameValues.map[json["billing_last_name"]],
        billingAddress1: json["billing_address_1"],
        billingAddress2: json["billing_address_2"],
        billingCity: json["billing_city"],
        billingState: json["billing_state"],
        billingZip: json["billing_zip"],
        billingCountry: json["billing_country"],
        shippingFirstName: stNameValues.map[json["shipping_first_name"]],
        shippingLastName: stNameValues.map[json["shipping_last_name"]],
        shippingAddress1: json["shipping_address_1"],
        shippingAddress2: json["shipping_address_2"],
        shippingCity: json["shipping_city"],
        shippingState: json["shipping_state"],
        shippingZip: json["shipping_zip"],
        shippingCountry: json["shipping_country"],
        subTotal: Discount.fromJson(json["sub_total"]),
        shippingMethod: json["shipping_method"],
        shippingCost: Discount.fromJson(json["shipping_cost"]),
        couponId: json["coupon_id"] == null ? null : json["coupon_id"],
        discount: Discount.fromJson(json["discount"]),
        total: Discount.fromJson(json["total"]),
        paymentMethod: json["payment_method"],
        currency: currencyValues.map[json["currency"]],
        currencyRate: json["currency_rate"],
        locale: localeValues.map[json["locale"]],
        status: statusValues.map[json["status"]],
        mobileToken: json["mobile_token"] == null ? null : json["mobile_token"],
        note: json["note"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "customer_email": customerEmailValues.reverse[customerEmail],
        "customer_phone": customerPhone,
        "customer_first_name": stNameValues.reverse[customerFirstName],
        "customer_last_name": stNameValues.reverse[customerLastName],
        "billing_first_name": stNameValues.reverse[billingFirstName],
        "billing_last_name": stNameValues.reverse[billingLastName],
        "billing_address_1": billingAddress1,
        "billing_address_2": billingAddress2,
        "billing_city": billingCity,
        "billing_state": billingState,
        "billing_zip": billingZip,
        "billing_country": billingCountry,
        "shipping_first_name": stNameValues.reverse[shippingFirstName],
        "shipping_last_name": stNameValues.reverse[shippingLastName],
        "shipping_address_1": shippingAddress1,
        "shipping_address_2": shippingAddress2,
        "shipping_city": shippingCity,
        "shipping_state": shippingState,
        "shipping_zip": shippingZip,
        "shipping_country": shippingCountry,
        "sub_total": subTotal.toJson(),
        "shipping_method": shippingMethod,
        "shipping_cost": shippingCost.toJson(),
        "coupon_id": couponId == null ? null : couponId,
        "discount": discount.toJson(),
        "total": total.toJson(),
        "payment_method": paymentMethod,
        "currency": currencyValues.reverse[currency],
        "currency_rate": currencyRate,
        "locale": localeValues.reverse[locale],
        "status": statusValues.reverse[status],
        "mobile_token": mobileToken == null ? null : mobileToken,
        "note": note,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum StName { KIRA }

final stNameValues = EnumValues({"kira": StName.KIRA});

enum Currency { EGP }

final currencyValues = EnumValues({"EGP": Currency.EGP});

enum CustomerEmail { KIRA_EGTAZ_COM }

final customerEmailValues =
    EnumValues({"kira@egtaz.com": CustomerEmail.KIRA_EGTAZ_COM});

class Discount {
  Discount({
    this.amount,
    this.formatted,
    this.currency,
    this.inCurrentCurrency,
  });

  String amount;
  String formatted;
  Currency currency;
  InCurrentCurrency inCurrentCurrency;

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
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

enum Locale { AR }

final localeValues = EnumValues({"ar": Locale.AR});

enum Status { PENDING, COMPLETED, CANCELED, PENDING_PAYMENT, PROCESSING }

final statusValues = EnumValues({
  "canceled": Status.CANCELED,
  "completed": Status.COMPLETED,
  "pending": Status.PENDING,
  "pending_payment": Status.PENDING_PAYMENT,
  "processing": Status.PROCESSING
});

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
