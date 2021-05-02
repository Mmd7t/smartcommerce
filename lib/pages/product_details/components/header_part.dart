import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/widgets/global_image.dart';
import 'package:smartcommerce/widgets/indicators.dart';

class HeaderPart extends StatefulWidget {
  @override
  _HeaderPartState createState() => _HeaderPartState();
}

class _HeaderPartState extends State<HeaderPart> {
  int currentIndex = 0;
  final controller = Get.find<ProductsController>();
  final AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: controller.productDetails.value.files.length,
                itemBuilder: (context, index, realIndex) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: GlobalImage.globalImage(
                        controller.productDetails.value.files[index].path),
                  ),
                ),
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.99,
                  autoPlayInterval: Duration(seconds: 3),
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              Indicators(
                cindex: currentIndex,
                length: controller.productDetails.value.files.length,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    "${controller.productDetails.value.name}",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          height: 1.3,
                          fontWeight: FontWeight.bold,
                          color: Color(appController.accentColor.value),
                        ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${controller.productDetails.value.reviewsCount}',
                    ),
                    IconButton(
                      splashColor: Color(appController.accentColor.value),
                      splashRadius: 25,
                      icon: Icon(
                        Icons.star,
                        size: 30,
                        color: Color(appController.primaryColor.value),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(appController.accentColor.value)),
          ),
          child: Text(
            'الماركة : ' + "${controller.productDetails.value.brand.name}",
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Color(appController.accentColor.value),
                ),
          ),
        ),
      ],
    );
  }
}
