import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:timeago/timeago.dart' as timeago;


customTimeAgo({@required DateTime dateTime, @required BuildContext context}) {
   if (Get.locale.toLanguageTag() == 'ar') {
    timeago.setLocaleMessages(Get.locale.toLanguageTag(), timeago.ArMessages());
  } else {
    timeago.setLocaleMessages(Get.locale.toLanguageTag(), timeago.EnMessages());
  }

  return Text(
    timeago.format(dateTime, locale: Get.locale.toLanguageTag()),
    style: Theme.of(context).textTheme.caption,
  );
}
