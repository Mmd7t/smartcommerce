import 'package:shared_preferences/shared_preferences.dart';

class FCMStorage {
  static storeFCM(String data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("FCM", data);
  }

  static Future<String> getFCM() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String data = pref.getString("FCM");
    return data ?? "";
  }

  static removeFCM() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("FCM");
  }
}
