import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';

roundedBorderBottomSheet(context) {
  final AppController appController = Get.find<AppController>();
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(appController.primaryColor.value).withOpacity(0.1),
              ),
              child: Text(
                "المزيد",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline6.fontSize,
                  color: Color(appController.primaryColor.value),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                'خدمة العملاء',
                style: TextStyle(
                  color: Color(appController.accentColor.value),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('خدمة متاحة 24 ساعة'),
              leading: Image.asset(
                'assets/delivery.png',
                width: MediaQuery.of(context).size.width * 0.1,
                color: Color(appController.primaryColor.value),
              ),
            ),
            ListTile(
              title: Text(
                'دفع اونلاين',
                style: TextStyle(
                  color: Color(appController.accentColor.value),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('سرعة الدفع'),
              leading: Image.asset(
                'assets/delivery.png',
                width: MediaQuery.of(context).size.width * 0.1,
                color: Color(appController.primaryColor.value),
              ),
            ),
            ListTile(
              title: Text(
                'الجودة و الدقة',
                style: TextStyle(
                  color: Color(appController.accentColor.value),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('جودة و دقة لا مثيل لها'),
              leading: Image.asset(
                'assets/delivery.png',
                width: MediaQuery.of(context).size.width * 0.1,
                color: Color(appController.primaryColor.value),
              ),
            ),
            ListTile(
              title: Text(
                'شحن سريع',
                style: TextStyle(
                  color: Color(appController.accentColor.value),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('شحن سريع و توصيل ممتاز'),
              leading: Image.asset(
                'assets/delivery.png',
                width: MediaQuery.of(context).size.width * 0.1,
                color: Color(appController.primaryColor.value),
              ),
            ),
          ],
        ),
      );
    },
  );
}
