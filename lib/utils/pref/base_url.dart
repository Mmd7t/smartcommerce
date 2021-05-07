import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class BaseUrlStorage {
  static storeUrl(String data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("Url", data);
  }

  static Future<String> getUrl() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String data = pref.getString("Url");
    return data ?? Constants.baseUrls[2];
  }

  static removeUrl() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("Url");
  }
}
