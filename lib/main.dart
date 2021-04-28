import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/pages/onboarding/onboarding_page.dart';
import 'package:smartcommerce/utils/app_routes.dart';
import 'package:smartcommerce/utils/theme.dart';
import 'translations/translations.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   super.initState();

  // }

  @override
  Widget build(BuildContext context) {
    Get.put(AppController()).getPrimaryColorFromPrefs(context);
    Get.put(AppController()).getAccentColorFromPrefs(context);
    Get.put(AppController()).getThemeFromPrefs();
    return GetX(
      builder: (AppController controller) => GetMaterialApp(
        title: 'Smart Commerce',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: controller.isDark.value ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.list,
        initialRoute: OnBoardingPage.routeName,
        translations: Messages(),
        locale: const Locale('ar', 'EG'),
      ),
    );
  }
}
