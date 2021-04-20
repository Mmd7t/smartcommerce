import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartcommerce/models/cart.dart';
import 'package:sqflite/sqflite.dart';

class CartDB {
  Database db;

  Future<void> init() async {
    Directory documentDir = await getApplicationDocumentsDirectory();
    final path = join(documentDir.path, "cart.db");
    db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute("""
      CREATE TABLE Cart
      (
      id INTEGER PRIMARY KEY,
      count INTEGER,
      quantity INTEGER,
      inStock INTEGER,
      manageStock INTEGER,
      imageUrl TEXT,
      basePrice BLOB,
      specialPrice BLOB,
      sellingPrice BLOB,
      name TEXT
      )
      """);
    });
  }

  Future<List<Cart>> getCarts() async {
    List<Cart> ret = [];
    List<Map<String, dynamic>> maps = await db.query(
      "Cart",
    );
    if (maps != null && maps.length > 0) {
      maps.forEach((cart) {
        ret.add(Cart.fromDb(cart));
      });
    }

    return ret;
  }

  addCart(Cart cart) async {
    return await db.insert("Cart", cart.toDB(cart));
  }

  deleteCarts() async {
    return await db.delete(
      "Cart",
      where: null,
    );
  }

  deleteSelectedCart(int id) async {
    return await db.delete(
      "Cart",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  updateSelectedCart(Cart cart) async {
    return await db.update(
      "Cart",
      cart.toDB(cart),
      where: "id = ?",
      whereArgs: [cart.id],
    );
  }
}
