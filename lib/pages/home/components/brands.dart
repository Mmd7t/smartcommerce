import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/home_controller.dart';
import 'package:smartcommerce/pages/products_pages/products.dart';
import 'package:smartcommerce/widgets/global_image.dart';

class HomeBrands extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      width: size.width,
      height: size.width * 0.35,
      alignment: Alignment.center,
      child: Obx(
        () => ListView.builder(
          itemCount: homeController.brandsList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(Products.routeName),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.amber[700],
                              width: 1.5,
                            ),
                            image: DecorationImage(
                              image: GlobalImage.globalImageProvider(
                                  homeController.brandsList[index].files[0]),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(homeController.brandsList[index].name),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
