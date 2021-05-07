import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/notification_controller.dart';
import 'package:smartcommerce/pages/cart/cart_screen.dart';
import 'package:smartcommerce/pages/notification/notifications.dart';
import 'package:smartcommerce/utils/constants.dart';

import 'badge.dart';

class GlobalAppBar extends PreferredSize {
  final String title;
  final bool isCartPage;
  final bool isNotification;
  GlobalAppBar(
      {this.title = Constants.appName,
      this.isCartPage = false,
      this.isNotification = false});
  final AppController appController = Get.find<AppController>();
  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        iconTheme:
            IconThemeData(color: Color(appController.primaryColor.value)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
        ),
        actions: [
          (isCartPage)
              ? const SizedBox()
              : IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    Get.toNamed(CartScreen.routeName);
                  },
                ),
          (isNotification)
              ? const SizedBox()
              : IconButton(
                  icon: MixinBuilder(
                    init: NotificationController(),
                    builder: (NotificationController controller) => Badge(
                      child: Icon(
                        Icons.notifications,
                      ),
                      value: controller.getUnreadCount().toString(),
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(Notifications.routeName);
                  },
                ),
          SizedBox(
            width: 10,
          ),
        ],
        title: Text(
          title,
          style: TextStyle(
            color: Color(appController.accentColor.value),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
