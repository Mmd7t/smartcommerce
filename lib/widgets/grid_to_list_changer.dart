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
        color:
            Theme.of(context).inputDecorationTheme.fillColor.withOpacity(0.2),
        border: Border.all(
          color: Theme.of(context).accentColor,
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
      child: Obx(
        () => IconButton(
          padding: const EdgeInsets.all(0.0),
          splashRadius: Material.defaultSplashRadius - 5,
          splashColor: Theme.of(context).primaryColor,
          icon: (appController.isGrid.value)
              ? const Icon(Icons.list_rounded)
              : const Icon(Icons.grid_on_outlined),
          color: Theme.of(context).accentColor,
          onPressed: () {
            appController.changeView();
          },
        ),
      ),
    );
  }
}
