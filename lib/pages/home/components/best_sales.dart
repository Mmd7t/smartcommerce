import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/home_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/pages/products_pages/products.dart';
import 'package:smartcommerce/widgets/global_image.dart';
import 'package:smartcommerce/widgets/progress.dart';

class HomeBestSales extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  static const radius = 10.0;
  @override
  Widget build(BuildContext context) {
    return Column(
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
          () => (homeController.isFeaturedCatsLoading.value)
              ? circularDefaultProgress(context)
              : Column(
                  children: List.generate(
                    homeController.featuredCategoriesList.length,
                    (index) => AspectRatio(
                      aspectRatio: 16 / 8,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(radius),
                        splashColor: Get.theme.primaryColor,
                        onTap: () {
                          ProductsController controller =
                              Get.put(ProductsController());
                          controller.selectedFeaturedCatsProducts.value =
                              homeController.featuredCategoriesList[index].id;
                          controller.getFeaturedCatsProducts();
                          Get.toNamed(ProductsByBrands.routeName);
                        },
                        child: Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          child: AnimatedContainer(
                            padding: const EdgeInsets.all(4),
                            duration: const Duration(milliseconds: 500),
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              border: Border.all(
                                  color: Colors.amber[700], width: 1.5),
                            ),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: MediaQuery.of(context).size.width * 0.43,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius - 2),
                                border: Border.all(
                                  color: Colors.amber[700],
                                  width: 1.5,
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: GlobalImage.globalImageProvider(
                                      homeController
                                          .featuredCategoriesList[index].logo),
                                ),
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
