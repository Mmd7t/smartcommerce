import 'package:flutter/material.dart';

roundedBorderBottomSheet(context) {
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor,
                  ],
                  radius: 2,
                ),
              ),
              child: Text(
                "المزيد",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline6.fontSize,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text('خدمة العملاء'),
              subtitle: Text('خدمة متاحة 24 ساعة'),
              leading: Image.asset(
                'assets/delivery.png',
                width: MediaQuery.of(context).size.width * 0.1,
              ),
            ),
            ListTile(
              title: Text('دفع اونلاين'),
              subtitle: Text('سرعة الدفع'),
              leading: Image.asset(
                'assets/delivery.png',
                width: MediaQuery.of(context).size.width * 0.1,
              ),
            ),
            ListTile(
              title: Text('الجودة و الدقة'),
              subtitle: Text('جودة و دقة لا مثيل لها'),
              leading: Image.asset(
                'assets/delivery.png',
                width: MediaQuery.of(context).size.width * 0.1,
              ),
            ),
            ListTile(
              title: Text('شحن سريع'),
              subtitle: Text('شحن سريع و توصيل ممتاز'),
              leading: Image.asset(
                'assets/delivery.png',
                width: MediaQuery.of(context).size.width * 0.1,
              ),
            ),
          ],
        ),
      );
    },
  );
}
