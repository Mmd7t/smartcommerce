import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                        padding: const EdgeInsets.symmetric(horizontal: 8),
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
