import 'package:flutter/material.dart';
import 'package:smartcommerce/pages/registration/sign_btn.dart';
import 'package:smartcommerce/widgets/global_textfield.dart';

class ForgetPasswordPage extends StatefulWidget {
  static const String routeName = 'forgetPasswordPage';

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  String email;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            SafeArea(
                child: Image.asset(
              'assets/smart_commerce_logo.png',
              width: MediaQuery.of(context).size.width * 0.6,
            )),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  GlobalTextField(
                    hint: 'email',
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
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: SignBtn(
                      text: 'send code',
                      onClicked: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
