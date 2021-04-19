import 'package:shared_preferences/shared_preferences.dart';

mixin SharedPrefAddress {
  Future<int> getSelected() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.getInt("addressFav");
  }

  setSelected(int id) async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.setInt("addressFav", id);
  }

  deleteSelected() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.remove("addressFav");
  }

  Future<int> getLatest() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.getInt("addressLatest");
  }

  setLatest(int id) async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.setInt("addressLatest", id);
  }

  deleteLatest() async {
    final _shared = await SharedPreferences.getInstance();

    return _shared.remove("addressLatest");
  }
}
