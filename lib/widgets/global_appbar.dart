import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/pages/cart/cart_screen.dart';
import 'package:smartcommerce/utils/constants.dart';

class GlobalAppBar extends PreferredSize {
  final String title;
  final bool isCartPage;
  const GlobalAppBar({this.title = Constants.appName, this.isCartPage = false});
  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        style: const TextStyle(
          color: const Color(0xFF007460),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
