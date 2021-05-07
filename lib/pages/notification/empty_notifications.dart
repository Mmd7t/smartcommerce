import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.notification_important,
                color: Get.theme.primaryColor,
                size: 170,
              ),
              Text("noNotifications".tr,
                  style: Theme.of(context)
                      .textTheme
                      .display3
                      .copyWith(color: Get.theme.primaryColor),
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
