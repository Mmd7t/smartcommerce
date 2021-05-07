import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/widgets/auth_first_screen.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';
import 'package:smartcommerce/widgets/progress.dart';

import '../main_page.dart';
import 'fav_frid.dart';

class FavoritePage extends StatefulWidget {
  static const String routeName = 'favoritePage';

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: "FavScreenTitle".tr, isCartPage: true),
      body: GetX(
        init: AuthController(),
        builder: (AuthController controller) => controller.apiToken == null
            ? _unAuthFav()
            : controller.wishListLoading.value == true
                ? circularDefaultProgress(context)
                : controller.userProfileModel.value.wishList.isNotEmpty
                    ? FavGrid(controller.userProfileModel.value.wishList)
                    : empty(context),
      ),
    );
  }

  _unAuthFav() {
    return Stack(
      children: <Widget>[
        AuthFirstScreen(
          message: "FavLoginMessage".tr,
        ),
        Positioned(
          bottom: 1,
          left: 1,
          right: 1,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            child: TextButton(
              onPressed: () => Get.offAllNamed(MainPage.routeName),
              child: Text(
                'continueShopping'.tr,
                style: TextStyle(
                    color: Color(appController.primaryColor.value),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color(appController.accentColor.value)),
              ),
            ),
          ),
        )
      ],
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
        Text('اضف هنا منتجاتك المفضلة'.tr),
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
