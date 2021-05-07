import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/pages/registration/components/login_form.dart';
import 'package:smartcommerce/pages/registration/components/signup_form.dart';
import 'package:smartcommerce/pages/registration/components/social_btn.dart';
import 'package:smartcommerce/utils/helper/social_helper.dart';
import 'package:smartcommerce/widgets/progress.dart';

enum RegistrationType { login, signUp }

class Registration extends StatefulWidget {
  static const String routeName = 'registration';
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var _type = RegistrationType.signUp;
  bool loadingSocial = false;
  final AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: loadingSocial == true
              ? Center(
                  child: circularDefaultProgress(context),
                )
              : Column(
                  children: [
                    const SizedBox(height: 20),
                    SafeArea(
                        child: Image.asset(
                      'assets/smart_commerce_logo.png',
                      width: MediaQuery.of(context).size.width * 0.6,
                    )),
                    const SizedBox(height: 20),
                    _switchSignBtn(context),
                    _registerationBox(context),
                  ],
                ),
        ),
      ),
    );
  }

/*------------------------------------------------------------------------------------------*/
/*-----------------------------------  Registration Box  -----------------------------------*/
/*------------------------------------------------------------------------------------------*/

  _registerationBox(context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          (_type == RegistrationType.login) ? LoginForm() : SignupForm(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialBtn(
                    icon: FontAwesomeIcons.google,
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    onClicked: () async {
                      setState(() {
                        loadingSocial = true;
                      });
                      await SocialHelper.signWithGoogle();
                      setState(() {
                        loadingSocial = false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  SocialBtn(
                    icon: FontAwesomeIcons.facebookF,
                    color: Colors.indigo,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    onClicked: () async {
                      setState(() {
                        loadingSocial = true;
                      });
                      await SocialHelper.signWithFacebook();
                      setState(() {
                        loadingSocial = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

/*-----------------------------------------------------------------------------------------*/
/*-----------------------------------  Switch Sign Btn  -----------------------------------*/
/*-----------------------------------------------------------------------------------------*/

  _switchSignBtn(context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width * 0.35,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: Text(
              'login'.tr,
              style: Theme.of(context).textTheme.button.copyWith(
                    color: (_type == RegistrationType.login)
                        ? Colors.white
                        : Colors.black,
                  ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              ),
            ),
            color: (_type == RegistrationType.login)
                ? Color(appController.accentColor.value)
                : Colors.grey.shade300,
            onPressed: () {
              setState(() {
                _type = RegistrationType.login;
              });
            },
          ),
          const SizedBox(width: 5),
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width * 0.35,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: Text(
              'signup'.tr,
              style: Theme.of(context).textTheme.button.copyWith(
                    color: (_type == RegistrationType.signUp)
                        ? Colors.white
                        : Colors.black,
                  ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            color: (_type == RegistrationType.signUp)
                ? Color(appController.accentColor.value)
                : Colors.grey.shade300,
            onPressed: () {
              setState(() {
                _type = RegistrationType.signUp;
              });
            },
          ),
        ],
      ),
    );
  }
}
