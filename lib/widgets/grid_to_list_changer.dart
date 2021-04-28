import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';

class GridToListChanger extends StatelessWidget {
  final AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: Color(appController.primaryColor.value).withOpacity(0.2),
        border: Border.all(
          color: Color(appController.accentColor.value),
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
      child: Obx(
        () => IconButton(
          padding: const EdgeInsets.all(0.0),
          splashRadius: Material.defaultSplashRadius - 5,
          splashColor: Color(appController.primaryColor.value),
          icon: (appController.isGrid.value)
              ? const Icon(Icons.list_rounded)
              : const Icon(Icons.grid_on_outlined),
          color: Color(appController.accentColor.value),
          onPressed: () {
            appController.changeView();
          },
        ),
      ),
    );
  }
}
