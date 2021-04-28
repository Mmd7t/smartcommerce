import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';

class EmptyAddress extends StatelessWidget {
  final AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_off,
          size: 100,
          color: Color(appController.accentColor.value),
        ),
        Text("emptyAddress".tr)
      ],
    );
  }
}
