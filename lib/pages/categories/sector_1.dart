import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/home_controller.dart';
import 'package:smartcommerce/widgets/global_image.dart';

class CategoriesSectorOne extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Obx(
          () => CarouselSlider.builder(
            itemCount: homeController.featuredCategoriesList.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: constraints.maxWidth - 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: GlobalImage.globalImageProvider(
                                  homeController
                                      .featuredCategoriesList[index].logo),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${homeController.featuredCategoriesList[index].name}',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }),
              );
            },
            options: CarouselOptions(
              enlargeCenterPage: true,
              viewportFraction: 0.3,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              aspectRatio: 3 / 5,
              onPageChanged: (index, reason) {},
            ),
          ),
        ),
      ),
    );
  }
}
