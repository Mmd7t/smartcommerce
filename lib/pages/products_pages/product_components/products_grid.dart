import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/utils/constants.dart';

class ProductsGrid extends StatelessWidget {
  static const double radius = 10;

  final ProductsType type;

  const ProductsGrid({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: ProductsController(),
      builder: (ProductsController controller) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 5,
          ),
          itemCount: (type == ProductsType.brand)
              ? controller.brandProducts.value.products.data.length
              : controller.featuredCatsProducts.value.products.data.length,
          itemBuilder: (context, index) {
            List data;
            if (type == ProductsType.brand) {
              data = controller.brandProducts.value.products.data;
            } else {
              data = controller.featuredCatsProducts.value.products.data;
            }
            return ClipRRect(
              borderRadius: BorderRadius.circular(ProductsGrid.radius),
              child: InkWell(
                borderRadius: BorderRadius.circular(ProductsGrid.radius),
                splashColor: Theme.of(context).accentColor,
              ),
            );
          },
        );
      },
    );
  }
}
