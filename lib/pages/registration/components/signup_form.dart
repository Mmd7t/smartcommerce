import 'package:flutter/material.dart';
import 'package:smartcommerce/models/user_model.dart';
import 'package:smartcommerce/pages/registration/components/sign_btn.dart';
import 'package:smartcommerce/widgets/global_textfield.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  RegisterModel userModel = RegisterModel();
  String email, fName, lName, pass;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            GlobalTextField(
              hint: 'الاسم الأول',
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
            GlobalTextField(
              hint: 'اسم العائلة',
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SignBtn(
                text: 'تسجيل حساب',
                onClicked: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    // AuthService.signUp(context, email, pass, fName, lName);
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