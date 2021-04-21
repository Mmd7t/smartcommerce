import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorDialog({String content}) {
  Get.defaultDialog(
    content: Text(content),
    title: 'error',
    actions: [TextButton(onPressed: () => Get.back(), child: const Text('OK'))],
  );
}
