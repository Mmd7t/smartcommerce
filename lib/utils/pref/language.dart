import 'package:shared_preferences/shared_preferences.dart';

class LanguageStorage {
  static storeLanguage(String language) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("lang", language);
  }

  static Future<String> getLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("lang");
  }

  static removeLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("lang");
  }
}
