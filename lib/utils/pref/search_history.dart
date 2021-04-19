import 'package:shared_preferences/shared_preferences.dart';

mixin SearchHistory {
  Future<bool> checkHistory() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.containsKey("history");
  }

  Future<List<String>> getHistory() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.getStringList("history");
  }

  Future setHistory(List<String> key) async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.setStringList("history", key);
  }

  deleteHistory() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.remove("history");
  }
}
