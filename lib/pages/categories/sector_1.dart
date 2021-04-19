import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/category_controller.dart';
import 'package:smartcommerce/widgets/global_image.dart';
import 'package:smartcommerce/widgets/progress.dart';

class CategoriesSectorOne extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Obx(
          () => controller.fetchingMainCategories.value == true
              ? circularDefaultProgress(context)
              : CarouselSlider.builder(
                  itemCount: controller.categoriesParentList.length,
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
                                    fit: BoxFit.fill,
                                    image: GlobalImage.globalImageProvider(
                                        controller.categoriesParentList[index]
                                            .logo.path),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${controller.categoriesParentList[index].name}',
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
                    onPageChanged: (index, reason) {
                      controller.selectedSubCategories.value =
                          controller.categoriesParentList[index].id;
                      controller.getSelectedSubCategories();
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
