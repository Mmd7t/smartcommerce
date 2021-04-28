import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/widgets/progress.dart';

import '../main_page.dart';
import 'fav_frid.dart';

class FavoritePage extends StatelessWidget {
  static const String routeName = 'favoritePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX(
        init: AuthController(),
        builder: (AuthController controller) =>
            controller.wishListLoading.value == true
                ? circularDefaultProgress(context)
                : controller.userProfileModel.value.wishlist.isNotEmpty
                    ? FavGrid(controller.userProfileModel.value.wishlist)
                    : empty(context),
      ),
    );
  }
}

empty(BuildContext context) {
  final AppController appController = Get.find<AppController>();
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.favorite,
          color: Color(appController.primaryColor.value).withOpacity(0.3),
          size: 200,
        ),
        const SizedBox(height: 10),
        Text('اضف هنا منتجاتك المفضلة'),
        const SizedBox(height: 10),
        MaterialButton(
          color: Color(appController.accentColor.value),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(MainPage.routeName),
          child: Text(
            'تصفح المنتجات',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
