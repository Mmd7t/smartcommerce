import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/models/auth_model.dart';
import 'package:smartcommerce/pages/registration/components/forget_password.dart';
import 'package:smartcommerce/pages/registration/components/sign_btn.dart';
import 'package:smartcommerce/widgets/global_textfield.dart';
import 'package:smartcommerce/widgets/progress.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var email, pass;
  final formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
  final appController = Get.find<AppController>();
  // login loading
  bool isLoading = false;
  LoginModel loginModel;
  @override
  void initState() {
    super.initState();
    loginModel = LoginModel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            GlobalTextField(
              hint: 'email'.tr,
              prefixIcon: Icons.email_outlined,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
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
            Obx(
              () => GlobalTextField(
                hint: 'password'.tr,
                textInputType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                prefixIcon: Icons.lock_outline,
                obscure: appController.isObscure.value,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  color: Color(appController.primaryColor.value),
                  onPressed: () {
                    appController.changeObscure();
                  },
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'please enter password';
                  } else if (value.length < 6) {
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: (isLoading)
                  ? circularProgress(context, size: 40)
                  : SignBtn(
                      text: 'login'.tr,
                      onClicked: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          setState(() {
                            isLoading = true;
                          });
                          authController
                              .login(LoginModel(
                            email: email,
                            password: pass,
                          ))
                              .then((value) {
                            setState(() {
                              isLoading = false;
                            });
                          });
                        }
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(ForgetPasswordPage.routeName),
                child: Text(
                  'forget password'.tr,
                  style: TextStyle(
                      color: Color(appController.primaryColor.value),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
