import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EmptyProductDetails extends StatelessWidget {
  final String text;
  final double height;
  EmptyProductDetails({@required this.text, this.height = 400});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/no_data.svg",
              height: 100,
            ),
            Text(
              text ?? 'Opps...',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Get.theme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
