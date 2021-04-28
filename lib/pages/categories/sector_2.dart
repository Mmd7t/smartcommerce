import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/category_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/pages/products_pages/products.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/widgets/custom_image.dart';
import 'package:smartcommerce/widgets/progress.dart';

class CategoriesSectorTwo extends StatelessWidget {
  static const radius = 10.0;
  final AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      flex: 3,
      child: GetX(
          init: CategoryController(),
          builder: (CategoryController controller) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              child: SingleChildScrollView(
                child: Center(
                  child: controller.subCategoriesListLoader() == true
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Center(
                            child: circularDefaultProgress(context),
                          ),
                        )
                      : Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          runSpacing: 10.0,
                          spacing: 10.0,
                          children: List.generate(
                            controller.subCategoriesList().length,
                            (index) => InkWell(
                              onTap: () {
                                ProductsController productsController =
                                    Get.put(ProductsController());
                                productsController
                                        .selectedCategoryProduct.value =
                                    controller.subCategoriesList()[index].id;
                                productsController.selectedCategory.value =
                                    controller.selectedSubCategories.value;

                                productsController
                                    .getSelectedCategoryProducts();

                                Get.toNamed(ProductsByBrands.routeName,
                                    arguments: ProductsType.category);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: size.width * 0.46,
                                height: size.width * 0.46,
                                child: Card(
                                  elevation: 2.5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(radius),
                                  ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Positioned.fill(
                                          child: cachedNetworkImage(
                                            controller
                                                .subCategoriesList()[index]
                                                .logo
                                                .path,
                                            radius: radius,
                                          ),
                                        ),
                                        Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Color(appController
                                                .accentColor.value),
                                            borderRadius: BorderRadius.vertical(
                                                bottom:
                                                    Radius.circular(radius)),
                                          ),
                                          child: GridTileBar(
                                            title: Text(
                                              controller
                                                  .subCategoriesList()[index]
                                                  .name
                                                  .toString(),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            );
          }),
    );
  }
}
