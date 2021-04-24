import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/models/auth_model.dart';
import 'package:smartcommerce/pages/registration/components/sign_btn.dart';
import 'package:smartcommerce/widgets/global_textfield.dart';
import 'package:smartcommerce/widgets/progress.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  RegisterModel userModel = RegisterModel();
  final authController = Get.find<AuthController>();
  String email, fName, lName, pass;
  // login loading
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
/*------------------------------------------------------------------------------------*/
/*-----------------------------------  First Name  -----------------------------------*/
/*------------------------------------------------------------------------------------*/
            GlobalTextField(
              hint: 'firstname'.tr,
              prefixIcon: Icons.person_outline,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'please enter first name';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  fName = value;
                });
              },
            ),
            const SizedBox(height: 5),
/*------------------------------------------------------------------------------------*/
/*-----------------------------------  Last Name  ------------------------------------*/
/*------------------------------------------------------------------------------------*/
            GlobalTextField(
              hint: 'lastname'.tr,
              prefixIcon: Icons.person_outline,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'please enter last name';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  lName = value;
                });
              },
            ),
            const SizedBox(height: 5),
/*------------------------------------------------------------------------------------*/
/*-------------------------------------  Email  --------------------------------------*/
/*------------------------------------------------------------------------------------*/
            GlobalTextField(
              hint: 'email'.tr,
              prefixIcon: Icons.email_outlined,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'please enter email';
                } else if (!value.contains('@')) {
                  return 'please enter a valid email';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            const SizedBox(height: 5),
/*------------------------------------------------------------------------------------*/
/*------------------------------------  Password  ------------------------------------*/
/*------------------------------------------------------------------------------------*/
            GlobalTextField(
              hint: 'password'.tr,
              prefixIcon: Icons.lock_outline,
              obscure: true,
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: Theme.of(context).primaryColor,
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'please enter password';
                } else if (value.length <= 6) {
                  return 'password must be al least 6 digits';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  pass = value;
                });
              },
            ),
/*------------------------------------------------------------------------------------*/
/*------------------------------------  Sign Btn  ------------------------------------*/
/*------------------------------------------------------------------------------------*/
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: (isLoading)
                  ? circularProgress(context, size: 40)
                  : SignBtn(
                      text: 'signup'.tr,
                      onClicked: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          setState(() {
                            isLoading = true;
                          });
                          authController
                              .register(
                            RegisterModel(
                              firstName: fName,
                              lastName: lName,
                              email: email,
                              password: pass,
                              privacyPolicy: 1,
                            ),
                          )
                              .then((value) {
                            setState(() {
                              setState(() {
                                isLoading = false;
                              });
                            });
                          });
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
