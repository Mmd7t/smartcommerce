import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

circularProgress(BuildContext context, {double size = 70.0, Color color}) {
  return Center(
    child: SpinKitWave(
      color: color == null ? Theme.of(context).accentColor : color,
      size: size,
    ),
  );
}

circularMainProgress(BuildContext context, {Color color}) {
  return Center(
    child: SpinKitWanderingCubes(
      color: Get.theme.primaryColor,
    ),
  );
}

circularDefaultProgress(BuildContext context,
    {double size = 70.0, Color color}) {
  return Center(
    child: SpinKitWanderingCubes(
      color: color == null ? Theme.of(context).accentColor : color,
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
