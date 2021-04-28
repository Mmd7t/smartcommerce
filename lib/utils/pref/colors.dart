import 'package:shared_preferences/shared_preferences.dart';

mixin ColorsPrefs {
/*--------------------------------  Primary Color  -------------------------------*/
  Future<bool> checkPrimaryColor() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.containsKey("primaryColor");
  }

  Future<int> getPrimaryColor() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.getInt("primaryColor");
  }

  Future setPrimaryColor(int value) async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.setInt("primaryColor", value);
  }

/*--------------------------------  Accent Color  --------------------------------*/
  Future<bool> checkAccentColor() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.containsKey("accentColor");
  }

  Future<int> getAccentColor() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.getInt("accentColor");
  }

  Future setAccentColor(int value) async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.setInt("accentColor", value);
  }
}
