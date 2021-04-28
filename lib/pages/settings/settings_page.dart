import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart'
    hide useWhiteForeground;
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = 'settingsPage';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with WidgetsBindingObserver {
  Color primaryPickerColor = Colors.white;
  Color accentPickerColor = Colors.white;

  AppController controller = Get.find<AppController>();

  // @override
  // initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  // }

  // @override
  // dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

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
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        titlePadding: const EdgeInsets.all(0.0),
                        contentPadding: const EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: primaryPickerColor,
                            onColorChanged: (value) {
                              setState(() {
                                primaryPickerColor = value;
                              });
                            },
                            pickerAreaBorderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                controller.changePrimaryColor(
                                    primaryPickerColor.value, context);
                                Theme.of(context)
                                    .copyWith(primaryColor: primaryPickerColor);
                                Get.back();
                              },
                              child: Text('Done')),
                        ],
                      );
                    },
                  );
                } else if (index == 2) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        titlePadding: const EdgeInsets.all(0.0),
                        contentPadding: const EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: accentPickerColor,
                            onColorChanged: (value) {
                              setState(() {
                                accentPickerColor = value;
                              });
                            },
                            pickerAreaBorderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                controller
                                    .changeAccentColor(accentPickerColor.value);
                                Get.back();
                              },
                              child: Text('Done')),
                        ],
                      );
                    },
                  );
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
              trailing: (index == 3)
                  ? Switch(
                      value: controller.isDark.value,
                      onChanged: (value) {
                        controller.changeTheme(value);
                        // if (val) {
                        //   // changeStatusColor(Colors.black);
                        // } else {
                        //   // changeStatusColor(Colors.white);
                        // }
                      },
                    )
                  : Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  // changeStatusColor(Color color) async {
  //   try {
  //     await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
  //     if (useWhiteForeground(color)) {
  //       FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  //       FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
  //     } else {
  //       FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  //       FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
  //     }
  //   } on PlatformException catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
}
