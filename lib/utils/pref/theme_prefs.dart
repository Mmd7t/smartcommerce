import 'package:shared_preferences/shared_preferences.dart';

mixin ThemePrefs {
/*--------------------------------  Primary Color  -------------------------------*/
  Future<bool> checkTheme() async {
    final _shared = await SharedPreferences.getInstance();
    return _shared.containsKey("theme");
  }

  Future<bool> getTheme() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.getBool("theme");
  }

  Future setTheme(bool value) async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.setBool("theme", value);
  }
}
