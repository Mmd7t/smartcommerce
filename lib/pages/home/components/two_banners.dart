import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/home_controller.dart';
import 'package:smartcommerce/widgets/global_image.dart';

class TwoBanners extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // child: Obx(
      //   () => Row(
      //     children: [
      //       Expanded(
      //         child: Container(
      //           height: 100,
      //           margin: const EdgeInsets.all(3),
      //           child: GlobalImage.globalImage(
      //               homeController.twoBannersModel.value.banner1.image.path),
      //           decoration: BoxDecoration(
      //             color: Colors.red,
      //             // image: DecorationImage(
      //             //   image: NetworkImage(homeController
      //             //       .twoBannersModel.value.banner1.image.path),
      //             //   fit: BoxFit.cover,
      //             //   alignment: Alignment.topCenter,
      //             // ),
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         child: Container(
      //           height: 100,
      //           margin: const EdgeInsets.all(3),
      //           child: GlobalImage.globalImage(
      //               homeController.twoBannersModel.value.banner2.image.path),
      //           decoration: BoxDecoration(
      //             color: Colors.red,
      //             // image: DecorationImage(
      //             //   image: NetworkImage(banners.banner2.image.path),
      //             //   fit: BoxFit.cover,
      //             //   alignment: Alignment.topCenter,
      //             // ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
