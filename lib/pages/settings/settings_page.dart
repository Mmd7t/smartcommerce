import 'package:flutter/material.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = 'settingsPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: 'settings'.tr),
      body: Column(
        children: List.generate(
          4,
          (index) => Card(
            elevation: 2.5,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              onTap: () {
                print(index);
                if (index == 0) {
                  // Get.toNamed(OrdersPage.routeName);
                } else if (index == 1) {
                  // Get.toNamed(MyAddressScreen.routeName);
                } else if (index == 2) {
                  // Get.toNamed(UserReviews.routeName);
                } else {
                  // Get.toNamed(UserReviews.routeName);
                }
              },
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              leading: Icon(
                index == 0
                    ? Icons.language
                    : index == 1
                        ? Icons.colorize
                        : index == 2
                            ? Icons.palette
                            : Icons.brightness_3,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                index == 0
                    ? "language".tr
                    : index == 1
                        ? "change primary color".tr
                        : index == 2
                            ? "change accent color".tr
                            : "theme".tr,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
