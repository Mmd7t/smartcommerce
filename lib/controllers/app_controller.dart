import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/controllers/category_controller.dart';
import 'package:smartcommerce/controllers/flashsale_controller.dart';
import 'package:smartcommerce/controllers/home_controller.dart';
import 'package:smartcommerce/controllers/orders_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/controllers/search_controller.dart';
import 'package:smartcommerce/controllers/static_pages_controller.dart';
import 'package:smartcommerce/models/shipping_fee.dart';
import 'package:smartcommerce/pages/onboarding/onboarding_page.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/helper/language_set_helper.dart';
import 'package:smartcommerce/utils/pref/base_url.dart';
import 'package:smartcommerce/utils/pref/colors.dart';
import 'package:smartcommerce/utils/pref/theme_prefs.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class AppController extends GetxController with ColorsPrefs, ThemePrefs {
  RxBool isGrid = true.obs;
  RxBool isObscure = RxBool(true);
  RxBool isDark = false.obs;
  RxInt primaryColor = 0xFFFFA000.obs;
  RxInt accentColor = 0xFF007460.obs;
  Rx<ShippingFee> shippingFee = ShippingFee.empty().obs;
  RxBool loadingShippingFees = RxBool(false);

  RxString endUrl = RxString(Constants.baseUrls[2]);

  getShippingFees() async {
    loadingShippingFees.value = true;
    final client = RestClient(Dio(BaseOptions(
        headers: Constants.headers,
        baseUrl: '${endUrl.value}/${LanguageHelper.decodeLanguage()}/api/')));

    ShippingFee fees = await client.loadingShippingCost();

    if (fees != null) {
      shippingFee.value = fees;
    }
    loadingShippingFees.value = false;
  }

  getThemeFromPrefs() async {
    bool val = await checkTheme();
    if (val) {
      isDark.value = await getTheme();
    } else {
      isDark.value = false;
    }
  }

  getPrimaryColorFromPrefs(context) async {
    bool val = await checkPrimaryColor();
    if (val) {
      primaryColor.value = await getPrimaryColor();
    } else {
      primaryColor.value = 0xFFFFA000;
    }
  }

  getAccentColorFromPrefs(context) async {
    bool val = await checkAccentColor();
    if (val) {
      accentColor.value = await getAccentColor();
    } else {
      accentColor.value = 0xFF007460;
    }
  }

  changeView() {
    isGrid.value = !isGrid.value;
  }

  changeObscure() {
    isObscure.value = !isObscure.value;
  }

  changePrimaryColor(int value, context) {
    primaryColor.value = value;
    setPrimaryColor(value);
  }

  changeAccentColor(int value) {
    accentColor.value = value;
    setAccentColor(value);
  }

  changeTheme(bool value) {
    isDark.value = value;
    setTheme(value);
  }

  updateUrl(String url) async {
    print(url);
    await BaseUrlStorage.storeUrl(url);
    endUrl.value = url;
    Get.put(AuthController()).updateClient();
    Get.put(CartController()).updateClient();
    Get.put(CategoryController()).updateClient();
    Get.put(FlashSaleController()).updateClient();
    Get.put(HomeController()).updateClient();
    Get.put(OrdersController()).updateClient();
    Get.put(ProductsController()).updateClient();
    Get.put(SearchController()).updateClient();
    Get.put(StaticPagesController()).updateClient();

    Get.offAllNamed(OnBoardingPage.routeName);
  }

  updateLang() async {
    Get.put(AuthController()).updateClient();
    Get.put(CartController()).updateClient();
    Get.put(CategoryController()).updateClient();
    Get.put(FlashSaleController()).updateClient();
    Get.put(HomeController()).updateClient();
    Get.put(OrdersController()).updateClient();
    Get.put(ProductsController()).updateClient();
    Get.put(SearchController()).updateClient();
    Get.put(StaticPagesController()).updateClient();

    Get.offAllNamed(OnBoardingPage.routeName);
  }

  Future<void> getUrl() async {
    endUrl.value = await BaseUrlStorage.getUrl();
  }
}
