 import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_off,
          size: 100,
          color: Theme.of(context).accentColor,
        ),
        Text("emptyAddress".tr)
      ],
    );
  }
}
