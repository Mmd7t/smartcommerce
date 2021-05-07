import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/pages/registration/registration.dart';

Future<bool> showAuthAlertDialog() async {
  return await showDialog(
    context: Get.context,
    builder: (context) => CupertinoAlertDialog(
      title: Icon(
        Icons.error_outline,
        color: Get.theme.primaryColor,
        size: 80,
      ),
      content: Column(
        children: [
          Text('registerFirst'.tr),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: RawMaterialButton(
                  onPressed: () => Navigator.of(context).pop(),
                  fillColor: Get.theme.primaryColor,
                  child: Text(
                    'cancel'.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: FlatButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () => Get.toNamed(Registration.routeName),
                  child: Text(
                    'signIn'.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
