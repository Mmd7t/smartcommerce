import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "paymentMethods".tr,
            ),
            SizedBox(height: 10),
            RadioListTile(
              title: Text(
                "cashOnDelivery".tr,
              ),
              activeColor: Theme.of(context).accentColor,
              selected: true,
              onChanged: (boo) {},
              groupValue: true,
              value: true,
            ),
          ],
        ),
      ),
    );
  }
}
