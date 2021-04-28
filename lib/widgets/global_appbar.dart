import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/pages/cart/cart_screen.dart';
import 'package:smartcommerce/utils/constants.dart';

class GlobalAppBar extends PreferredSize {
  final String title;
  final bool isCartPage;
  GlobalAppBar({this.title = Constants.appName, this.isCartPage = false});
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
