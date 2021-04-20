import 'package:get/get.dart';

class Coupon {
  int id;
  String couponId;
  bool freeShipping;
  String minimumSpend;
  String value;
  double valueAmount;
  int isPercentage;
  double minimumSpendAmount;
  String maximumSpend;
  double maximumSpendAmount;
  DateTime startDate;
  DateTime endDate;
  Map<String, String> name = {};

  Coupon.fromJson(Map json) {
    id = json["id"] ?? 0;
    couponId = json["code"] ?? "";
    isPercentage = json["is_percent"] ?? 0;
    if (json["is_percent"] == 0) {
      value = json["value"]["formatted"] ?? "0.0";
      valueAmount =
          json["value"]["inCurrentCurrency"]["amount"].toDouble() ?? 0.0;
    } else {
      value = json["value"] ?? "0.0";
      valueAmount = double.parse(json["value"]).toDouble() ?? 0.0;
    }
    freeShipping = json["free_shipping"] ?? false;
    minimumSpend = json['minimum_spend'] != null
        ? json['minimum_spend']["inCurrentCurrency"]['formatted'] ?? ""
        : "";
    minimumSpendAmount = json['minimum_spend'] != null
        ? json['minimum_spend']["inCurrentCurrency"]['amount'].toDouble() ?? 0.0
        : 0.0;
    maximumSpend = json['maximum_spend'] != null
        ? json['maximum_spend']["inCurrentCurrency"]['formatted'] ?? ""
        : "";
    maximumSpendAmount = json['maximum_spend'] != null
        ? json['maximum_spend']["inCurrentCurrency"]['amount'].toDouble() ??
            1000000000.0
        : 1000000000.0;
    startDate = json['start_date'] != null
        ? DateTime.parse(json['start_date'])
        : DateTime.now();
    endDate = json['end_date'] != null
        ? DateTime.parse(json['end_date'])
        : DateTime.now();
    name[Get.locale.toLanguageTag()] = json['name'];
    if (json["translations"] != null) {
      json["translations"].forEach((lang) {
        name[lang['locale']] = lang['name'];
      });
    }
  }

  Coupon.empty() {
    id = 0;
    freeShipping = false;
    minimumSpendAmount = 100000000.0;
    valueAmount = 0.0;
    isPercentage = 0;
    maximumSpendAmount = 100000000.0;
  }
  toMap() {
//    id = json["id"];
//    couponId = json["code"];
//    active = json["is_active"];
//    freeShipping = json["free_shipping"];
//    minimumSpend = json['minimum_spend']['amount'];
//    minimumSpendAmount = json['minimum_spend']['formatted'];
//    maximumSpend = json['maximum_spend']['amount'];
//    maximumSpendAmount = json['maximum_spend']['formatted'];
//    startDate = json['start_date'] != null
//        ? DateTime.parse(json['start_date'])
//        : DateTime.now();
//    endDate = json['end_date'] != null
//        ? DateTime.parse(json['start_date'])
//        : DateTime.now();
//    name["en"] = json['name'];
//    json["translations"].forEach((lang) {
//      name[lang['locale']] = lang['name'];
  }
}
