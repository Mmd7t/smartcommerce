import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/home_controller.dart';
import 'package:smartcommerce/widgets/global_image.dart';

class HomeCategoriesList extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 4 / 1.8,
      child: Container(
        width: size.width,
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
                        backgroundImage: GlobalImage.globalImageProvider(
                            homeController.categoriesList[index].logo),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${homeController.categoriesList[index].name}',
                        style: TextStyle(color: Colors.red),
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
      ),
    );
  }
}
