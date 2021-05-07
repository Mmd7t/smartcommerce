import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/pages/onboarding/onboarding_page.dart';
import 'package:smartcommerce/utils/app_routes.dart';
import 'package:smartcommerce/utils/db/notification_db.dart';
import 'package:smartcommerce/utils/pref/notification_count.dart';
import 'package:smartcommerce/utils/theme.dart';

import 'models/notification.dart';
import 'translations/translations.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  NotificationDB db = NotificationDB();
  await db.init();
  db.addNotification(NotificationModule.fromJson(
      message, await NotificationCountStorage.getNotificationCount()));
  db.close();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  await Firebase.initializeApp();
  FCMConfig().init(onBackgroundMessage: _firebaseMessagingBackgroundHandler);
  // runApp(
  //   MyApp(),
  // );
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://7e68570c32974100b9a506dc0a8e1808@o188831.ingest.sentry.io/5753297';
    },
    appRunner: () => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(AppController(), permanent: true).getPrimaryColorFromPrefs(context);
    Get.put(AppController(), permanent: true).getAccentColorFromPrefs(context);
    Get.put(AppController(), permanent: true).getThemeFromPrefs();
    return GetX(
      builder: (AppController controller) => GetMaterialApp(
        title: 'Smart Commerce',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: controller.isDark.value ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.list,
        supportedLocales: const [
          Locale('ar', 'EG'),
          Locale('en', 'US'),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: OnBoardingPage.routeName,
        translations: Messages(),
        locale: const Locale('ar', 'EG'),
      ),
    );
  }
}
