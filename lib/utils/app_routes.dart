import 'package:get/get.dart';
import 'package:smartcommerce/pages/addresses/new_shipping_address.dart';
import 'package:smartcommerce/pages/addresses/user_address.dart';
import 'package:smartcommerce/pages/favorite/favorite_page.dart';
import 'package:smartcommerce/pages/main_page.dart';
import 'package:smartcommerce/pages/onboarding/onboarding_page.dart';
import 'package:smartcommerce/pages/orders/orders_page.dart';
import 'package:smartcommerce/pages/product_details/product_details_page.dart';
import 'package:smartcommerce/pages/products_pages/products.dart';
import 'package:smartcommerce/pages/registration/registration.dart';
import 'package:smartcommerce/pages/user_review/user_reviews.dart';

class AppPages {
  static var list = [
    GetPage(
      name: OnBoardingPage.routeName,
      page: () => OnBoardingPage(),
    ),
    GetPage(
      name: MainPage.routeName,
      page: () => MainPage(),
    ),
    GetPage(
      name: Registration.routeName,
      page: () => Registration(),
    ),
    GetPage(
      name: MyAddressScreen.routeName,
      page: () => MyAddressScreen(),
    ),
    GetPage(
      name: UserReviews.routeName,
      page: () => UserReviews(),
    ),
    GetPage(
      name: NewShippingAddress.routeName,
      page: () => NewShippingAddress(),
    ),
    GetPage(
      name: ProductsByBrands.routeName,
      page: () => ProductsByBrands(),
    ),
    GetPage(
      name: FavoritePage.routeName,
      page: () => FavoritePage(),
    ),
    GetPage(
      name: ProductDetails.routeName,
      page: () => ProductDetails(),
    ),
    GetPage(
      name: OrdersPage.routeName,
      page: () => OrdersPage(),
    ),
  ];
}
