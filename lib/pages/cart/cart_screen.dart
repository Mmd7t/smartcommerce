import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/pages/main_page.dart';
import 'package:smartcommerce/utils/helper/help.dart';
import 'package:smartcommerce/widgets/auth_first_screen.dart';
import 'package:smartcommerce/widgets/cart_item.dart';
import 'package:smartcommerce/widgets/empty/empty_cart.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = 'CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = Get.put(CartController());
  AuthController user = Get.put(AuthController());
  final AppController appController = Get.find<AppController>();
  @override
  void initState() {
    Timer(Duration(milliseconds: 100), () {
      Get.put(CartController()).updateCartData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => user.apiToken == null ? _unAuthCart() : _authCart());
  }

  _unAuthCart() {
    return Obx(
      () => Scaffold(
        appBar: GlobalAppBar(title: "cartScreenTitle".tr, isCartPage: true),
        body: Stack(
          children: <Widget>[
            AuthFirstScreen(
              message: "cartLoginMessage".tr,
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
        ),
      ),
    );
  }

  _authCart() {
    return Scaffold(
      appBar: GlobalAppBar(title: "cartScreenTitle".tr, isCartPage: true),
      body: cartController.cartData.isEmpty
          ? EmptyCart()
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 120),
                      itemCount: cartController.cartData.length,
                      itemBuilder: (context, index) => CartItem(
                        key: ValueKey(cartController.cartData[index].id),
                        cartId: cartController.cartData[index].id,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    left: 1,
                    right: 1,
                    child: cartController.cartData.isEmpty
                        ? null
                        : Material(
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${"total".tr}: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(fontSize: 18),
                                      ),
                                      Helper.getPrice(
                                          cartController.totalPrice, context),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(
                                            appController.accentColor.value),
                                      ),
                                      onPressed: cartController.isValidating()
                                          ? null
                                          : () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         CheckoutScreen(),
                                              //   ),
                                              // );
                                            },
                                      child: Text(
                                        '${"checkout".tr} (${cartController.itemsCount})',
                                        style: TextStyle(
                                            color: Color(appController
                                                .primaryColor.value),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
    );
  }
}
