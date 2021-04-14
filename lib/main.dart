import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/pages/onboarding/onboarding_page.dart';
import 'package:smartcommerce/utils/app_routes.dart';

import 'translations/translations.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Commerce',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      routes: appRoutes(context),
      initialRoute: OnboardingPage.routeName,
      translations: Messages(),
      locale: const Locale('ar', 'EG'),
    );
  }
}
