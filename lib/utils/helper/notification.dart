import 'package:fcm_config/fcm_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

showNotification(RemoteMessage message) {
  FlutterLocalNotificationsPlugin local = FlutterLocalNotificationsPlugin();

  var android = AndroidNotificationDetails(
    "com.scope.interior.design.app",
    "com.scope.interior.design.app",
    "channelDescription",
    icon: "@mipmap/ic_launcher",
    importance: Importance.high,
    priority: Priority.high,
  );
  var ios = IOSNotificationDetails(
    presentAlert: true,
    presentSound: true,
  );
  var platform = NotificationDetails(android: android, iOS: ios);
  local.show(
      0, message.data["title"] ?? "", message.data["body"] ?? "", platform);
}
