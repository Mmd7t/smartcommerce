import 'package:flutter/material.dart';
import 'package:smartcommerce/models/user_model.dart';
import 'package:smartcommerce/pages/registration/components/forget_password.dart';
import 'package:smartcommerce/pages/registration/components/sign_btn.dart';
import 'package:smartcommerce/widgets/global_textfield.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var email, pass;
  final formKey = GlobalKey<FormState>();
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
              hint: 'الايميل',
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
            GlobalTextField(
              hint: 'الرقم السرى',
              prefixIcon: Icons.lock_outline,
              obscure: true,
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: Theme.of(context).primaryColor,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SignBtn(
                text: 'تسجيل دخول',
                onClicked: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    // AuthService().login(context, email, pass);
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
                  'نسيت الرقم السرى ؟',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
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