import 'package:get/get.dart';
import 'package:smartcommerce/pages/addresses/new_shipping_address.dart';
import 'package:smartcommerce/pages/addresses/user_address.dart';
import 'package:smartcommerce/pages/cart/cart_screen.dart';
import 'package:smartcommerce/pages/cart/checkout_screen.dart';
import 'package:smartcommerce/pages/favorite/favorite_page.dart';
import 'package:smartcommerce/pages/main_page.dart';
import 'package:smartcommerce/pages/notification/notifications.dart';
import 'package:smartcommerce/pages/onboarding/onboarding_page.dart';
import 'package:smartcommerce/pages/orders/orders_page.dart';
import 'package:smartcommerce/pages/product_details/product_details_page.dart';
import 'package:smartcommerce/pages/products_pages/products.dart';
import 'package:smartcommerce/pages/registration/registration.dart';
import 'package:smartcommerce/pages/settings/settings_page.dart';
import 'package:smartcommerce/pages/static_pages/static_page.dart';
import 'package:smartcommerce/pages/user_review/user_reviews.dart';

class AppPages {
  static var list = [
    GetPage(
      name: CartScreen.routeName,
      page: () => CartScreen(),
    ),
    GetPage(
      name: OnBoardingPage.routeName,
      page: () => OnBoardingPage(),
    ),
    GetPage(
      name: Notifications.routeName,
      page: () => Notifications(),
    ),
    GetPage(
      name: CheckoutScreen.routeName,
      page: () => CheckoutScreen(),
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
      name: ProductsPage.routeName,
      page: () => ProductsPage(),
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
    GetPage(
      name: SettingsPage.routeName,
      page: () => SettingsPage(),
    ),
    GetPage(
      name: StaticPage.routeName,
      page: () => StaticPage(),
    ),
  ];
}
