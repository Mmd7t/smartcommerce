import 'package:get/get.dart';
import 'package:smartcommerce/models/notification.dart';
import 'package:smartcommerce/utils/db/notification_db.dart';
import 'package:smartcommerce/utils/pref/notification_count.dart';

class NotificationController extends GetxController {
  RxList<NotificationModule> notifications = RxList<NotificationModule>();
  RxBool loading = RxBool(false);

  addNotification(msg) async {
    NotificationDB db = NotificationDB();
    await db.init();

    NotificationModule notification = NotificationModule.fromJson(
        msg, await NotificationCountStorage.getNotificationCount());
    db.addNotification(notification);
    notifications.add(notification);
    notifications.sort((a, b) => b.time.compareTo(a.time));
  }

  Future<void> getUserNotification() async {
    NotificationDB db = NotificationDB();
    await db.init();

    loading.value = true;
    if (!(db.db.isOpen)) {
      await db.init();
    }
    List<NotificationModule> ret = [];
    ret = await db.getNotifications();
    ret.sort((a, b) => b.time.compareTo(a.time));

    notifications.clear();
    notifications.addAll(ret);
    notifications.sort((a, b) => b.time.compareTo(a.time));
    loading.value = false;
  }

  int getUnreadCount() {
    int ret = 0;
    ret = notifications.where((element) => element.read == false).length;
    return ret;
  }

  readAll() async {
    NotificationDB db = NotificationDB();
    await db.init();

    if (notifications.isNotEmpty) {
      for (int index = 0; index < notifications.length; index++) {
        notifications[index].read = true;
        NotificationModule element = notifications[index];
        db.updateSelectedNotification(element);
      }
      notifications.sort((a, b) => b.time.compareTo(a.time));
    }
  }

  void clearAll() async {
    NotificationDB db = NotificationDB();
    await db.init();

    notifications.clear();
    db.deleteNotifications();
  }

  initAll() async {
    NotificationDB db = NotificationDB();

    await db.init();
    getUserNotification();
  }
}
