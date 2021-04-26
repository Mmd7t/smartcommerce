import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/pages/favorite/favorite_page.dart';
import 'package:smartcommerce/pages/main_page.dart';
import 'package:smartcommerce/pages/registration/registration.dart';
import 'package:smartcommerce/pages/settings/settings_page.dart';

class MyDrawer extends StatelessWidget {
  final apiController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GetX(
        init: AuthController(),
        builder: (AuthController controller) => Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(60))),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(60))),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                  accountName: Text(
                      controller.userProfileModel.value.firstName.toString() +
                          " " +
                          controller.userProfileModel.value.lastName.toString(),
                      style: const TextStyle(color: Colors.black)),
                  accountEmail: Text(
                      controller.userProfileModel.value.email.toString(),
                      style: const TextStyle(color: Colors.black)),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.offAll(MainPage.routeName);
                },
                title: Text("home".tr),
                leading: Icon(
                  Icons.home_outlined,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(FavoritePage.routeName);
                },
                title: Text("wishlist".tr),
                leading: Icon(
                  Icons.favorite_border,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.off(MainPage(
                    initial: 3,
                  ));
                },
                title: Text("offers".tr),
                leading: Icon(
                  Icons.tag,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.off(MainPage(
                    initial: 2,
                  ));
                },
                title: Text("cats".tr),
                leading: Icon(
                  Icons.category_outlined,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.off(MainPage(
                    initial: 1,
                  ));
                },
                title: Text("me".tr),
                leading: Icon(
                  Icons.person_outline,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text("more".tr),
                leading: Icon(
                  Icons.add,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text("call us".tr),
                leading: Icon(
                  Icons.call_outlined,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text("common questions".tr),
                leading: Icon(
                  Icons.chat_outlined,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text("privacy policy".tr),
                leading: Icon(
                  Icons.privacy_tip_outlined,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(SettingsPage.routeName);
                },
                title: Text("settings".tr),
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).accentColor,
                ),
              ),
              Divider(
                height: 10,
                color: Theme.of(context).primaryColor,
                endIndent: 30,
                indent: 30,
              ),
              (apiController.apiToken == null)
                  ? ListTile(
                      onTap: () {
                        Get.toNamed(Registration.routeName);
                      },
                      title: Text("login".tr),
                      leading: Icon(
                        Icons.exit_to_app_outlined,
                        color: Theme.of(context).accentColor,
                      ),
                    )
                  : ListTile(
                      onTap: () {
                        Get.put(AuthController()).logOut();
                      },
                      title: Text("logout".tr),
                      leading: Icon(
                        Icons.exit_to_app_outlined,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
