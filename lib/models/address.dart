import 'package:flutter/cupertino.dart';

class Address {
  int id;
  String city;
  String addressLine;
  String houseNumber;
  String phoneNumber;
  String zipCode;

  Address({
    @required this.id,
    @required this.city,
    @required this.addressLine,
    @required this.phoneNumber,
    @required this.houseNumber,
    @required this.zipCode,
  });
  Address.empty() {
    this.id = 0;
    this.city = "";
    this.addressLine = "";
    this.phoneNumber = "";
    this.houseNumber = "";
    this.zipCode = "";
  }

  Address.fromDb(Map db)
      : id = db["id"],
        city = db["city"],
        addressLine = db["addressLine"],
        phoneNumber = db["phoneNumber"],
        houseNumber = db["houseNumber"],
        zipCode = db["zipCode"];

  toMap(Address address) {
    Map<String, dynamic> ret = {
      "id": address.id,
      "city": address.city,
      "addressLine": address.addressLine,
      "phoneNumber": address.phoneNumber,
      "houseNumber": address.houseNumber,
      "zipCode": address.zipCode,
    };
    return ret;
  }
}
