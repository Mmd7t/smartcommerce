import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartcommerce/models/address.dart';
import 'package:sqflite/sqflite.dart';

class AddressDB {
  Database db;

  Future<void> init() async {
    Directory documentDir = await getApplicationDocumentsDirectory();
    final path = join(documentDir.path, "addresses.db");
    db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute("""
      CREATE TABLE Addresses
      (
      id INTEGER PRIMARY KEY,
      city TEXT,
      addressLine TEXT,
      houseNumber TEXT,
      phoneNumber TEXT,
      zipCode TEXT
      )
      """);
    });
  }

  Future<List<Address>> getAddress() async {
    List<Address> ret = [];
    List<Map<String, dynamic>> maps = await db.query(
      "Addresses",
    );
    if (maps != null && maps.length > 0) {
      maps.forEach((address) {
        ret.add(Address.fromDb(address));
      });
    }

    return ret;
  }

  addAddress(Address address) async {
    return await db.insert("Addresses", address.toMap(address));
  }

  deleteAddress() async {
    return await db.delete(
      "Addresses",
      where: null,
    );
  }

  deleteSelectedAddress(int id) async {
    return await db.delete(
      "Addresses",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
