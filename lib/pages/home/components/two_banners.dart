import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/home_controller.dart';
import 'package:smartcommerce/widgets/global_image.dart';
import 'package:smartcommerce/widgets/progress.dart';

class TwoBanners extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Obx(
        () => (homeController.isTwoBannersLoading.value)
            ? circularDefaultProgress(context)
            : Row(
                children: [
                  (homeController.twoBannersModel.value.banner1.image != null)
                      ? Expanded(
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.all(3),
                            child: GlobalImage.globalImage(homeController
                                .twoBannersModel.value.banner1.image.path),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                image: GlobalImage.globalImageProvider(
                                    homeController.twoBannersModel.value.banner1
                                        .image.path),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  (homeController.twoBannersModel.value.banner2.image != null)
                      ? Expanded(
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.all(3),
                            child: GlobalImage.globalImage(homeController
                                .twoBannersModel.value.banner2.image.path),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                image: GlobalImage.globalImageProvider(
                                    homeController.twoBannersModel.value.banner2
                                        .image.path),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
      ),
    );
  }
}
