import 'package:shared_preferences/shared_preferences.dart';

mixin UserAuthPref {
  Future<bool> checkKey() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.containsKey("userKey");
  }

  Future<String> getKey() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.getString("userKey");
  }

  setKey(String key) async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.setString("userKey", key);
  }

  deleteKey() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.remove("userKey");
  }

  Future<bool> checkToken() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.containsKey("token");
  }

  Future<String> getToken() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.getString("token");
  }

  setToken(String key) async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.setString("token", key);
  }

  deleteToken() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.remove("token");
  }

  Future<String> getLanguage() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.getString("languageKey");
  }

  setLanguage(String lang) async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.setString("languageKey", lang);
  }
}
