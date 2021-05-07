import 'package:get/get.dart';
import 'package:smartcommerce/models/notification.dart';
import 'package:smartcommerce/utils/db/notification_db.dart';
import 'package:smartcommerce/utils/pref/notification_count.dart';

class NotificationController extends GetxController {
  NotificationDB db = NotificationDB();
  RxList<NotificationModule> notifications = RxList<NotificationModule>();

  addNotification(msg) async {
    NotificationModule notification = NotificationModule.fromJson(
        msg, await NotificationCountStorage.getNotificationCount());
    db.addNotification(notification);
    notifications.add(notification);
    notifications.sort((a, b) => b.time.compareTo(a.time));
  }

  Future<void> getUserNotification() async {
    List<NotificationModule> ret = [];
    ret = await db.getNotifications();
    ret.sort((a, b) => b.time.compareTo(a.time));
    notifications.addAll(ret);
    notifications.sort((a, b) => b.time.compareTo(a.time));
  }

  int getUnreadCount() {
    int ret = 0;
    ret = notifications.where((element) => element.read == false).length;
    return ret;
  }

  readAll() async {
    if (notifications.isNotEmpty) {
      for (int index = 0; index < notifications.length; index++) {
        notifications[index].read = true;
        NotificationModule element = notifications[index];
        db.updateSelectedNotification(element);
      }
      notifications.sort((a, b) => b.time.compareTo(a.time));
    }
  }

  void clearAll() {
    notifications.clear();
    db.deleteNotifications();
  }

  @override
  void onInit() async {
    await db.init();
    getUserNotification();
    super.onInit();
  }
}
