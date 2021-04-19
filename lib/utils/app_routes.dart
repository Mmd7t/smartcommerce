import 'package:get/get.dart';
import 'package:smartcommerce/pages/addresses/new_shipping_address.dart';
import 'package:smartcommerce/pages/addresses/user_address.dart';
import 'package:smartcommerce/pages/main_page.dart';
import 'package:smartcommerce/pages/onboarding/onboarding_page.dart';
import 'package:smartcommerce/pages/registration/registration.dart';
import 'package:smartcommerce/pages/user_review/user_reviews.dart';

class AppPages {
  static var list = [
    GetPage(
      name: OnboardingPage.routeName,
      page: () => OnboardingPage(),
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
    ),    GetPage(
      name: UserReviews.routeName,
      page: () => UserReviews(),
    ),
    GetPage(
      name: NewShippingAddress.routeName,
      page: () => NewShippingAddress(),
    ),
  ];
}
