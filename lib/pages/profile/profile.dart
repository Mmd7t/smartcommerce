import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/orders_controller.dart';
import 'package:smartcommerce/pages/addresses/user_address.dart';
import 'package:smartcommerce/pages/orders/orders_page.dart';
import 'package:smartcommerce/pages/user_review/user_reviews.dart';
import 'package:smartcommerce/widgets/auth_first_screen.dart';

import '../main_page.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = 'profilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AuthController(),
        builder: (AuthController controller) {
          return Scaffold(
            body: controller.apiToken == null
                ? _unAuthProdile()
                : Center(
                    child: Column(
                      children: [
/*----------------------------------------------------------------------------------------------*/
/*---------------------------------------  Profile Image  --------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color(appController.primaryColor.value)
                                    .withOpacity(0.4),
                                width: 3),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(appController.primaryColor.value)
                                      .withOpacity(0.5),
                                  width: 3),
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  Color(appController.accentColor.value),
                              // backgroundImage: NetworkImage(persons[8]),
                            ),
                          ),
                        ),
/*----------------------------------------------------------------------------------------------*/
/*---------------------------------------  Profile Name  ---------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            controller.userProfileModel.value.firstName +
                                " " +
                                controller.userProfileModel.value.lastName,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        const SizedBox(height: 8),
/*----------------------------------------------------------------------------------------------*/
/*---------------------------------------  Profile Email  --------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            controller.userProfileModel.value.email,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                  color:
                                      Color(appController.primaryColor.value),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        const SizedBox(height: 12),
/*----------------------------------------------------------------------------------------------*/
/*---------------------------------------  Profile List  ---------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
                        ...List.generate(
                          3,
                          (index) => Card(
                            elevation: 2.5,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              onTap: () {
                                print(index);
                                if (index == 0) {
                                  Get.put(OrdersController()).getOrders();
                                  Get.toNamed(OrdersPage.routeName);
                                } else if (index == 1) {
                                  Get.toNamed(MyAddressScreen.routeName);
                                } else if (index == 2) {
                                  Get.toNamed(UserReviews.routeName);
                                } else {}
                              },
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              leading: Icon(
                                Icons.person_outline,
                                color: Color(appController.primaryColor.value),
                              ),
                              title: Text(
                                index == 0
                                    ? "الطلبات".tr
                                    : index == 1
                                        ? "سجل العناوين".tr
                                        : index == 2
                                            ? "التقييمات".tr
                                            : "".tr,
                                style: TextStyle(
                                  color: Color(appController.accentColor.value),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Color(appController.primaryColor.value),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }

  _unAuthProdile() {
    return Stack(
      children: <Widget>[
        AuthFirstScreen(
          message: "UserLoginMessage".tr,
        ),
        Positioned(
          bottom: 1,
          left: 1,
          right: 1,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            child: TextButton(
              onPressed: () => Get.offAllNamed(MainPage.routeName),
              child: Text(
                'continueShopping'.tr,
                style: TextStyle(
                    color: Color(appController.primaryColor.value),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color(appController.accentColor.value)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
