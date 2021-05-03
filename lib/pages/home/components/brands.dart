import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/home_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/pages/products_pages/products.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/widgets/global_image.dart';
import 'package:smartcommerce/widgets/progress.dart';

class HomeBrands extends StatefulWidget {
  @override
  _HomeBrandsState createState() => _HomeBrandsState();
}

class _HomeBrandsState extends State<HomeBrands> {
  final homeController = Get.find<HomeController>();
  ProductsController controller = Get.put(ProductsController());
  final AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          width: size.width * 0.8,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            'brands'.tr,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Color(appController.accentColor.value),
                ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: size.width,
          height: size.width * 0.35,
          alignment: Alignment.center,
          child: Obx(
            () => (homeController.isBrandsLoading.value)
                ? circularDefaultProgress(context, size: 40.0)
                : ListView.builder(
                    itemCount: homeController.brandsList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              controller.selectedBrandProduct.value =
                                  homeController.brandsList[index].id;
                              controller.getBrandProducts();
                            });

                            Get.toNamed(ProductsPage.routeName,
                                arguments: ProductsType.brand);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Card(
                                    elevation: 2.5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              GlobalImage.globalImageProvider(
                                                  homeController
                                                      .brandsList[index]
                                                      .files[0]),
                                          fit: BoxFit.fitWidth,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                homeController.brandsList[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Color(
                                          appController.accentColor.value),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
