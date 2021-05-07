import 'package:shared_preferences/shared_preferences.dart';

class NotificationCountStorage {
  static storeNotificationCount(int data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("notification", data);
  }

  static Future<int> getNotificationCount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int data = pref.getInt("notification");
    if (data == null) {
      data = 0;
    }
    data = data++;
    await storeNotificationCount(data);
    return data ?? 0;
  }

  static removeNotificationCount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("notification");
  }
}
