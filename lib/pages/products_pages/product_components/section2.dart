import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/widgets/grid_to_list_changer.dart';
import 'package:smartcommerce/widgets/progress.dart';

class ProductsSection2 extends StatelessWidget {
  final ProductsType type;
  ProductsSection2({this.type});
  final ProductsController controller = Get.put(ProductsController());
  final AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
/*----------------------------------------------------------------------------------------------*/
/*-----------------------------------  Grid & List Converter  ----------------------------------*/
/*----------------------------------------------------------------------------------------------*/
          GridToListChanger(),
/*----------------------------------------------------------------------------------------------*/
/*--------------------------------------  Products Count  --------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color: Color(appController.primaryColor.value).withOpacity(0.25),
              borderRadius: BorderRadius.circular(8),
            ),
            child: (type == ProductsType.brand)
                ? Obx(
                    () => controller.loadingBrandProducts.value == true
                        ? circularDefaultProgress(context,
                            size: 25,
                            color: Color(appController.primaryColor.value))
                        : Text(
                            '${controller.brandProducts.value.products.data.length} عنصر',
                            style: TextStyle(
                              color: Color(appController.primaryColor.value),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                  )
                : (type == ProductsType.category)
                    ? Obx(
                        () => controller.categoriesListLoader() == true
                            ? circularDefaultProgress(context,
                                size: 25,
                                color: Color(appController.primaryColor.value))
                            : Text(
                                '${controller.categoryProductList().length} عنصر',
                                style: TextStyle(
                                  color:
                                      Color(appController.primaryColor.value),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                      )
                    : Obx(
                        () => controller.loadingFeaturedCatsProducts.value ==
                                true
                            ? circularDefaultProgress(context,
                                size: 25,
                                color: Color(appController.primaryColor.value))
                            : Text(
                                '${controller.featuredCatsProducts.value.products.data.length} عنصر',
                                style: TextStyle(
                                  color:
                                      Color(appController.primaryColor.value),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                      ),
          ),
        ],
      ),
    );
  }
}
