import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/pages/registration/registration.dart';

class AuthFirstScreen extends StatelessWidget {
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
          SizedBox(
            height: 10.0,
          ),
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
              child: Text(
                "signIn".tr.toString().toUpperCase(),
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                Get.toNamed(Registration.routeName);
              })
        ],
      ),
    );
  }
}
