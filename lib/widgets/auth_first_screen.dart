import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/pages/registration/registration.dart';

class AuthFirstScreen extends StatelessWidget {
  final AppController appController = Get.find<AppController>();
  final String message;
  AuthFirstScreen({this.message = ""});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/noUser.svg",
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 10.0),
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              child: Text(
                "signIn".tr.toString().toUpperCase(),
                style:
                    TextStyle(color: Color(appController.primaryColor.value)),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color(appController.accentColor.value)),
              onPressed: () {
                Get.toNamed(Registration.routeName);
              })
        ],
      ),
    );
  }
}
