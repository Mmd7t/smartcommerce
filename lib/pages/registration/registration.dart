import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartcommerce/pages/registration/login_form.dart';
import 'package:smartcommerce/pages/registration/signup_form.dart';
import 'package:smartcommerce/pages/registration/social_btn.dart';

enum RegistrationType { login, signup }

class Registration extends StatefulWidget {
  static const String routeName = 'registration';
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var _type = RegistrationType.signup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    onClicked: () {},
                  ),
                  const SizedBox(height: 10),
                  SocialBtn(
                    icon: FontAwesomeIcons.facebookF,
                    color: Colors.indigo,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    onClicked: () {},
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
              'تسجيل دخول',
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
                ? Theme.of(context).accentColor
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
              'انشاء حساب',
              style: Theme.of(context).textTheme.button.copyWith(
                    color: (_type == RegistrationType.signup)
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
            color: (_type == RegistrationType.signup)
                ? Theme.of(context).accentColor
                : Colors.grey.shade300,
            onPressed: () {
              setState(() {
                _type = RegistrationType.signup;
              });
            },
          ),
        ],
      ),
    );
  }
}
