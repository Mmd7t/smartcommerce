import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';

circularProgress(BuildContext context, {double size = 70.0, Color color}) {
  final AppController appController = Get.find<AppController>();
  return Center(
    child: SpinKitWave(
      type: SpinKitWaveType.center,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color:
                color == null ? Color(appController.accentColor.value) : color,
          ),
        );
      },
      size: size,
    ),
  );
}

circularMainProgress({Color color}) {
  return Center(
    child: SpinKitChasingDots(
      color: Get.theme.primaryColor,
    ),
  );
}

circularDefaultProgress(BuildContext context,
    {double size = 70.0, Color color}) {
  final AppController appController = Get.find<AppController>();
  return Center(
    child: SpinKitChasingDots(
      color: color == null ? Color(appController.primaryColor.value) : color,
      size: size,
    ),
  );
}

linearProgress({Color color = Colors.black54}) {
  return LinearProgressIndicator(
    backgroundColor: Get.theme.accentColor,
    valueColor: AlwaysStoppedAnimation(
      color,
    ),
  );
}
