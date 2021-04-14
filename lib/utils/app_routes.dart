import 'package:get/get.dart';
import 'package:smartcommerce/pages/main_page.dart';
import 'package:smartcommerce/pages/onboarding/onboarding_page.dart';

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
  ];
}
