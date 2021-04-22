import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

circularProgress(BuildContext context, {double size = 70.0, Color color}) {
  return Center(
    child: SpinKitWave(
      type: SpinKitWaveType.center,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color == null ? Theme.of(context).accentColor : color,
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
  return Center(
    child: SpinKitChasingDots(
      color: color == null ? Theme.of(context).primaryColor : color,
      size: size,
    ),
  );
}

linearProgress() {
  return LinearProgressIndicator(
    valueColor: AlwaysStoppedAnimation(
      Colors.black54,
    ),
  );
}
