import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/pages/onboarding/onboarding_page.dart';
import 'package:smartcommerce/utils/app_routes.dart';
import 'package:smartcommerce/utils/theme.dart';

import 'translations/translations.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      title: 'Smart Commerce',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.list,
      initialRoute: OnBoardingPage.routeName,
      translations: Messages(),
      locale: const Locale('ar', 'EG'),
    );
  }
}
