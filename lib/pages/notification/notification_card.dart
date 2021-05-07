import 'package:flutter/material.dart';
import 'package:smartcommerce/models/notification.dart';
import 'package:smartcommerce/widgets/custom_timeago.dart';

class NotificationCard extends StatelessWidget {
  final Function onTap;
  final NotificationModule notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/logo.png', width: 60, height: 60),
                SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      notification.title,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    customTimeAgo(
                        dateTime: notification.time, context: context),
                  ],
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  NotificationCard({this.onTap, this.notification});
}
