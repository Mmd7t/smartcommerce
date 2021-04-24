import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/pages/main_page.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/ic_clear_shopping_cart.png",
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 35.0),
                Text(
                  '${"emptyBag".tr}',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            child: TextButton(
              onPressed: () => Get.offAllNamed(MainPage.routeName),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                '${"continueShopping".tr}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
