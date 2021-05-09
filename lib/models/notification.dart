import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationModule {
  int id;
  String title;
  String subTitle;
  String image;
  DateTime time;
  String status;
  String order;
  bool read;

  NotificationModule.fromDb(Map json) {
    title = json["title"] ?? "";
    id = json["id"] ?? 0;
    subTitle = json["subTitle"] ?? "";
    image = json["image"] ?? "";
    order = json["orderId"] ?? "";
    read = json["read"] == 0 ? false : true;
    time = json["time"] != null
        ? DateTime.parse(json["time"]) ?? DateTime.now()
        : DateTime.now();
    status = json["status"] ?? "";
  }

  NotificationModule.fromJson(RemoteMessage notification, int newId) {
    title = notification.notification.title ?? "";
    id = newId;
    subTitle = notification.notification.body ?? "";
    image = "";
    read = false;
    time = notification.sentTime;
    status = notification.data["status"] ?? "";
    order = notification.data["order"] ?? "";
    print("done parsing");
  }

  NotificationModule.fromBackGround(Map data, int newId) {
    title = data["title"] ?? "";
    id = newId;
    subTitle = data["body"] ?? "";
    image = "";
    read = false;
    time = DateTime.now();
    status = "";
    order = "";
    print("done parsing");
  }

  Map<String, dynamic> toMap(NotificationModule notificationModule) {
    String newTime = notificationModule.time.toIso8601String();
    Map<String, dynamic> ret = {
      "id": notificationModule.id,
      "time": newTime,
      "title": notificationModule.title,
      "subTitle": notificationModule.subTitle,
      "orderId": notificationModule.order,
      "image": notificationModule.image,
      "read": notificationModule.read == true ? 1 : 0,
      "status": notificationModule.status,
    };
    return ret.cast();
  }
}
