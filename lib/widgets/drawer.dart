import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/pages/favorite/favorite_page.dart';
import 'package:smartcommerce/pages/main_page.dart';
import 'package:smartcommerce/pages/registration/registration.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final apiController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
  }

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
                    gradient: LinearGradient(colors: [
                      Theme.of(context).accentColor,
                      Theme.of(context).primaryColor,
                    ], begin: Alignment.centerRight, end: Alignment.centerLeft),
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
                title: const Text("الرئيسية"),
                leading: Icon(
                  Icons.home_outlined,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(FavoritePage.routeName);
                },
                title: const Text("المفضلة"),
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
                title: const Text("العروض"),
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
                title: const Text("الفئات"),
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
                title: const Text("أنا"),
                leading: Icon(
                  Icons.person_outline,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: const Text("المزيد"),
                leading: Icon(
                  Icons.add,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: const Text("اتصل بنا"),
                leading: Icon(
                  Icons.call_outlined,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: const Text("الاسئلة الشائعة"),
                leading: Icon(
                  Icons.chat_outlined,
                  color: Theme.of(context).accentColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: const Text("سياسة الخصوصية"),
                leading: Icon(
                  Icons.privacy_tip_outlined,
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
                      title: const Text("تسجيل دخول"),
                      leading: Icon(
                        Icons.exit_to_app_outlined,
                        color: Theme.of(context).accentColor,
                      ),
                    )
                  : ListTile(
                      onTap: () {
                        Get.put(AuthController()).logOut();
                      },
                      title: const Text("تسجيل الخروج"),
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
