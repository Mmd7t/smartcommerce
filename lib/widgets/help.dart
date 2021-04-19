import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class Helper {
  static showToast(String message, BuildContext context, {TextStyle style}) {
    Toast.show(message, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  static confirmDelete(String message, BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).accentColor.withOpacity(0.8),
              title: Text(
                "areYouSure".tr,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              content: Text(
                message,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("no".tr),
                  textColor: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("yes".tr),
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ));
  }
}
