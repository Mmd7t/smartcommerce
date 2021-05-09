import 'package:fcm_config/fcm_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/notification_controller.dart';
import 'package:smartcommerce/utils/helper/notification.dart';
import 'package:smartcommerce/widgets/drawer.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';
import 'package:smartcommerce/widgets/rounded_bottom_sheet.dart';

import 'FlashSale_Page/FlashSalePage.dart';
import 'categories/categories_page.dart';
import 'home/home.dart';
import 'profile/profile.dart';

class MainPage extends StatefulWidget {
  static const String routeName = 'mainPage';
  final int initial;
  @override
  _MainPageState createState() => _MainPageState();

  MainPage({this.initial = 0});
}

class _MainPageState extends State<MainPage> {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  var android = AndroidInitializationSettings("@mipmap/ic_launcher");
  var ios = IOSInitializationSettings();
  FlutterLocalNotificationsPlugin local = FlutterLocalNotificationsPlugin();

  final AppController appController = Get.find<AppController>();
  final List<Widget> pages = [
    Home(),
    ProfilePage(),
    CategoriesPage(),
    FlashSalePage(),
    Container(),
  ];

  int pageIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageIndex = widget.initial;
    pageController = PageController(initialPage: widget.initial);

    Get.put(NotificationController()).getUserNotification();

    var platform = InitializationSettings(android: android, iOS: ios);
    local.initialize(platform);

    firebaseMessaging.setAutoInitEnabled(true);
    firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    FirebaseMessaging.onMessage.listen((message) {
      saveMessage(message);
      showNotification(message);
    });

    firebaseMessaging.requestPermission(
        sound: true,
        badge: true,
        alert: true,
        criticalAlert: true,
        announcement: true,
        provisional: true);
    getToken();
    super.initState();
  }

  getToken() async {
    String token = await firebaseMessaging.getToken();
    Get.put(AuthController()).updateToken(token);
    print(token);
  }

  saveMessage(msg) async {
    Get.put(NotificationController()).addNotification(msg);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(),
      drawer: MyDrawer(),
      body: PageView(
        controller: pageController,
        onPageChanged: (int index) => setState(() => pageIndex = index),
        physics: NeverScrollableScrollPhysics(),
        children: pages,
      ),
      extendBody: true,
      bottomNavigationBar: Card(
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Obx(
          () => ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BottomNavigationBar(
              elevation: 3,
              currentIndex: pageIndex,
              onTap: (value) {
                if (value != 4) {
                  pageController.jumpToPage(value);
                } else {
                  roundedBorderBottomSheet(context);
                }
              },
              selectedItemColor: Color(appController.primaryColor.value),
              selectedIconTheme:
                  IconThemeData(color: Color(appController.accentColor.value)),
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedItemColor: Colors.grey.shade600,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  icon: const Icon(Icons.home_outlined),
                  activeIcon: const Icon(Icons.home),
                  label: 'home'.tr,
                ),
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  icon: const Icon(Icons.person_outline),
                  activeIcon: const Icon(Icons.person),
                  label: 'me'.tr,
                ),
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  icon: const Icon(Icons.category_outlined),
                  activeIcon: const Icon(Icons.category),
                  label: 'cats'.tr,
                ),
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  icon: const Icon(Icons.local_offer_outlined),
                  activeIcon: const Icon(Icons.local_offer),
                  label: 'offers'.tr,
                ),
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  icon: const Icon(Icons.add_circle_outline),
                  activeIcon: const Icon(Icons.add_circle),
                  label: 'more'.tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
