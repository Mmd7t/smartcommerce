import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/notification_controller.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';
import 'package:smartcommerce/widgets/progress.dart';

import 'empty_notifications.dart';
import 'notification_card.dart';

class Notifications extends StatefulWidget {
  static const String routeName = '/notifications';

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'notification'.tr,
        isNotification: true,
      ),
      body: Container(
        child: GetX(
          initState: (_) async {
            await Get.put(NotificationController()).getUserNotification();
            Get.put(NotificationController()).readAll();
          },
          init: NotificationController(),
          builder: (NotificationController controller) {
            if (controller.notifications.isEmpty) {
              return Center(child: EmptyNotifications());
            } else if (controller.loading.value == true) {
              return circularDefaultProgress(context);
            } else {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Scrollbar(
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: controller.notifications.length,
                        itemBuilder: (context, index) {
                          return NotificationCard(
                              onTap: () {},
                              notification: controller.notifications[index]);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
