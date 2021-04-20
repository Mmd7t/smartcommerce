import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                SvgPicture.asset(
                  "assets/images/no_data.svg",
                  height: 200,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${"emptyBag".tr}',
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            child: FlatButton(
              onPressed: () => Get.offAllNamed(MainPage.routeName),
              child: Text(
                '${"continueShopping".tr}',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
