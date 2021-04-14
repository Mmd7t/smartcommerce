import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/home_controller.dart';

class HomeCategoriesList extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width * 0.37,
      alignment: Alignment.center,
      child: Obx(
        () => ListView.builder(
          itemCount: homeController.categoriesList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: size.width * 0.3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      maxRadius: size.width * 0.13,
                      backgroundColor: Theme.of(context).primaryColor,
                      backgroundImage: AssetImage('assets/product_image.png'),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${homeController.categoriesList[index].name}',
                      maxLines: 3,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
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
