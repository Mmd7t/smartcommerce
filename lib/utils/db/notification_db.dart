import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartcommerce/models/notification.dart';
import 'package:sqflite/sqflite.dart';

class NotificationDB {
  Database db;

  Future<void> init() async {
    Directory documentDir = await getApplicationDocumentsDirectory();
    final path = join(documentDir.path, "notification.db");
    db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute("""
      CREATE TABLE Notification
      (
      id INTEGER  PRIMARY KEY, 
      time TEXT,
      title TEXT,
      subTitle TEXT,
      orderId TEXT,
      image TEXT,
      read INTEGER,
      status TEXT
      )
      """);
    });
  }

  Future<List<NotificationModule>> getNotifications() async {
    List<NotificationModule> ret = [];
    List<Map<String, dynamic>> maps = await db.query(
      "Notification",
    );
    print(maps);
    if (maps != null && maps.length > 0) {
      maps.forEach((address) {
        ret.add(NotificationModule.fromDb(address));
      });
    }

    return ret;
  }

  addNotification(NotificationModule notification) async {
    if (!db.isOpen) {
      return await db.insert("Notification", notification.toMap(notification));
    }
  }

  updateSelectedNotification(NotificationModule notification) async {
    return await db.update(
      "Notification",
      notification.toMap(notification),
      where: "id = ?",
      whereArgs: [notification.id],
    );
  }

  deleteNotifications() async {
    return await db.delete(
      "Notification",
      where: null,
    );
  }

  close() {
    db.close();
  }
}
