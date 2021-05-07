import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class Helper {
  static getPrice(double price, BuildContext context, String priceTag,
      {TextStyle style}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Text("${price.toStringAsFixed(1)} $priceTag",
          style: style != null
              ? style
              : Theme.of(context).textTheme.title.copyWith(fontSize: 18)),
    );
  }

  static showToast(String message, BuildContext context, {TextStyle style}) {
    Toast.show(message, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  static Future<bool> networkDialog() async {
    return await Get.defaultDialog(
        title: "NetworkConnectionError".tr,
        content: Container(),
        barrierDismissible: false,
        actions: [
          ElevatedButton(
              child: Text("reload".tr),
              onPressed: () {
                Get.back(result: true);
              }),
        ]);
  }

  static showSnackBar(String title, String subtitle) {
    Get.snackbar(
      title,
      subtitle,
      backgroundColor: Colors.white,
      colorText: Get.theme.primaryColor,
      duration: Duration(seconds: 3),
    );
  }
}
