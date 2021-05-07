import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/static_pages_controller.dart';
import 'package:smartcommerce/pages/favorite/favorite_page.dart';
import 'package:smartcommerce/pages/main_page.dart';
import 'package:smartcommerce/pages/registration/registration.dart';
import 'package:smartcommerce/pages/settings/settings_page.dart';
import 'package:smartcommerce/pages/static_pages/static_page.dart';

class MyDrawer extends StatelessWidget {
  final controller = Get.find<AuthController>();
  final AppController appController = Get.find<AppController>();
  final staticPagesController = Get.find<StaticPagesController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Obx(
        () => Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(appController.primaryColor.value),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(60))),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(60))),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color(appController.accentColor.value),
                  ),
                  accountName: Text(
                    controller.userProfileModel.value.firstName.toString() +
                        " " +
                        controller.userProfileModel.value.lastName.toString(),
                  ),
                  accountEmail: Text(
                    controller.userProfileModel.value.email.toString(),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.offAll(MainPage.routeName);
                },
                title: Text("home".tr),
                leading: Icon(
                  Icons.home_outlined,
                  color: Color(appController.accentColor.value),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(FavoritePage.routeName);
                },
                title: Text("wishlist".tr),
                leading: Icon(
                  Icons.favorite_border,
                  color: Color(appController.accentColor.value),
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
                  color: Color(appController.accentColor.value),
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
                  color: Color(appController.accentColor.value),
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
                  color: Color(appController.accentColor.value),
                ),
              ),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: staticPagesController.staticPagesList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.pages,
                        color: Get.theme.primaryColor,
                      ),
                      onTap: () {
                        Get.toNamed(StaticPage.routeName,
                            arguments:
                                staticPagesController.staticPagesList[index]);
                      },
                      title: Text(
                          staticPagesController.staticPagesList[index].name),
                    );
                  },
                ),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(SettingsPage.routeName);
                },
                title: Text("settings".tr),
                leading: Icon(
                  Icons.settings,
                  color: Color(appController.accentColor.value),
                ),
              ),
              Divider(
                height: 10,
                color: Color(appController.primaryColor.value),
                endIndent: 30,
                indent: 30,
              ),
              (controller.apiToken == null)
                  ? ListTile(
                      onTap: () {
                        Get.toNamed(Registration.routeName);
                      },
                      title: Text("login".tr),
                      leading: Icon(
                        Icons.exit_to_app_outlined,
                        color: Color(appController.accentColor.value),
                      ),
                    )
                  : ListTile(
                      onTap: () {
                        Get.put(AuthController()).logOut(true);
                      },
                      title: Text("logout".tr),
                      leading: Icon(
                        Icons.exit_to_app_outlined,
                        color: Color(appController.accentColor.value),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
