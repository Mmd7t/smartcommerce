import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/home_controller.dart';
import 'package:smartcommerce/widgets/global_image.dart';

class HomeBestSales extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'أهم الفئات مبيعا',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline5.fontSize,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Obx(
          () => Column(
            children: List.generate(
              homeController.flashsaleProductsModel.value.flashProducts.length,
              (index) => AspectRatio(
                aspectRatio: 16 / 8,
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: AnimatedContainer(
                    padding: const EdgeInsets.all(4),
                    duration: const Duration(milliseconds: 500),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.amber[700], width: 1.5),
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: MediaQuery.of(context).size.width * 0.43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.amber[700],
                          width: 1.5,
                        ),
                        image: DecorationImage(
                          image: GlobalImage.globalImageProvider(homeController
                              .flashsaleProductsModel
                              .value
                              .flashProducts[index]
                              .baseImage),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
