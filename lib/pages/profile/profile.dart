import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/orders_controller.dart';
import 'package:smartcommerce/pages/addresses/user_address.dart';
import 'package:smartcommerce/pages/orders/orders_page.dart';
import 'package:smartcommerce/pages/user_review/user_reviews.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'profilePage';
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AuthController(),
        builder: (AuthController controller) {
          return Scaffold(
            body: Center(
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
                          color: Theme.of(context).accentColor.withOpacity(0.4),
                          width: 3),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color:
                                Theme.of(context).accentColor.withOpacity(0.5),
                            width: 3),
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Theme.of(context).accentColor,
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
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  const SizedBox(height: 12),
/*----------------------------------------------------------------------------------------------*/
/*---------------------------------------  Profile List  ---------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
                  ...List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 1.5),
                        color: Theme.of(context).scaffoldBackgroundColor,
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
                        leading: Icon(Icons.person,
                            color: Theme.of(context).accentColor),
                        title: Text(
                          index == 0
                              ? "الطلبات".tr
                              : index == 1
                                  ? "سجل العناوين".tr
                                  : index == 2
                                      ? "التقييمات".tr
                                      : "".tr,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
