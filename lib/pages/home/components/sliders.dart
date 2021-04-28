import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/home_controller.dart';
import 'package:smartcommerce/widgets/global_image.dart';
import 'package:smartcommerce/widgets/indicators.dart';
import 'package:smartcommerce/widgets/progress.dart';

class Sliders extends StatefulWidget {
  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  final homeController = Get.find<HomeController>();
  final AppController appController = Get.find<AppController>();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => (homeController.isSlidersLoading.value)
              ? circularDefaultProgress(context, size: 40.0)
              : CarouselSlider.builder(
                  itemCount: homeController.slidersList[0].slides.length,
                  itemBuilder: (context, index, i) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: GlobalImage.globalImageProvider(
                                homeController
                                    .slidersList[0].slides[index].file.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Container(
                              color: Colors.white.withOpacity(0.1),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    homeController
                                        .slidersList[0].slides[index].caption1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(
                                      color: Color(
                                          appController.accentColor.value),
                                      fontWeight: FontWeight.bold,
                                      shadows: const [
                                        Shadow(
                                            color: Colors.white, blurRadius: 8),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.30),
                                    ),
                                    child: Text(
                                      homeController.slidersList[0]
                                          .slides[index].caption2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                        color: Color(
                                            appController.accentColor.value),
                                        fontWeight: FontWeight.bold,
                                        shadows: const [
                                          Shadow(
                                              color: Colors.white,
                                              blurRadius: 8),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    aspectRatio: 15 / 7.5,
                    viewportFraction: 0.97,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
        ),
        Indicators(cindex: currentIndex, length: 3),
      ],
    );
  }
}
