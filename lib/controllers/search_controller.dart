import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/models/search.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/pref/search_history.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class SearchController extends GetxController with SearchHistory {
  RestClient client = RestClient(
      Dio(BaseOptions(headers: Constants.headers, baseUrl: Constants.baseUrl)));
  RxList<String> searchHistory = <String>[].obs;

  RxBool loadingBrandProducts = RxBool(false);
  Rx<SearchData> searchData = SearchData().obs;

  updateClient() {
    client = RestClient(Dio(
        BaseOptions(headers: Constants.headers, baseUrl: Constants.baseUrl)));
  }

  searchForString(String query) async {
    addToSearchHistory(query);
    SearchData data = await client.searchProducts(
        Get.put(AuthController()).apiToken.value, query);
    if (data != null) {
      searchData.value = data;
    }
  }

  addToSearchHistory(String word) {
    if (searchHistory.contains(word)) {
      return;
    }
    searchHistory.insert(0, word);
    setHistory(searchHistory);
  }

  Future<void> loadSearchHistory() async {
    searchHistory = (await getHistory() ?? []).obs;
  }
}
