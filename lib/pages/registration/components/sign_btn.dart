import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';

class SignBtn extends StatelessWidget {
  final String text;
  final Function onClicked;
  final AppController appController = Get.find<AppController>();
  SignBtn({Key key, this.text, this.onClicked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(appController.accentColor.value),
      ),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
        child: Text(
          text,
          style:
              Theme.of(context).textTheme.button.copyWith(color: Colors.white),
        ),
        onPressed: onClicked,
      ),
    );
  }
}
