import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/pages/products_pages/product_components/products_grid.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/widgets/empty/empty_product_details.dart';
import 'package:smartcommerce/widgets/progress.dart';

class ProductsData extends StatelessWidget {
  static const double radius = 10;
  final ProductsType type;
  final ProductsController controller = Get.put(ProductsController());

  ProductsData({Key key, this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (type == ProductsType.brand)
        ? Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: controller.loadingBrandProducts.value == true
                  ? circularDefaultProgress(context)
                  : controller.brandProducts.value.products.data.isEmpty
                      ? EmptyProductDetails(text: "no products here".tr)
                      : ProductsGrid(),
            ),
          )
        : Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: controller.loadingfeaturedCatsProducts.value == true
                  ? circularDefaultProgress(context)
                  : controller.featuredCatsProducts.value.products.data.isEmpty
                      ? EmptyProductDetails(text: "no products here".tr)
                      : ProductsGrid(),
            ),
          );
  }
}
