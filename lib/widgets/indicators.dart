import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';

class Indicators extends StatelessWidget {
  final int cindex;
  final int length;

  Indicators({Key key, this.cindex, this.length}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find<AppController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: (index == cindex) ? 15 : 8,
          height: (index == cindex) ? 5 : 8,
          decoration: BoxDecoration(
            color: (index == cindex)
                ? Color(appController.primaryColor.value)
                : Color(appController.accentColor.value),
            borderRadius: BorderRadius.circular(100),
            border: (index == cindex)
                ? Border.fromBorderSide(BorderSide.none)
                : Border.all(color: Colors.white, width: 1.2),
          ),
        ),
      ),
    );
  }
}
