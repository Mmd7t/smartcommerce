import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/models/product_data.dart';
import 'package:smartcommerce/widgets/product_card/grid_card.dart';

import '../product_details/product_details_page.dart';

class ProductsGrid extends StatelessWidget {
  static const double radius = 10;

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: ProductsController(),
      builder: (ProductsController brandProductsController) {
        print(brandProductsController
            .brandProducts.value.products.data.first.brandId);
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 5,
          ),
          itemCount:
              brandProductsController.brandProducts.value.products.data.length,
          itemBuilder: (context, index) {
            List<ProductData> data =
                brandProductsController.brandProducts.value.products.data;
            return ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: InkWell(
                borderRadius: BorderRadius.circular(radius),
                splashColor: Theme.of(context).accentColor,
                onTap: () =>
                    Navigator.of(context).pushNamed(ProductDetails.routeName),
                child: ProductGridItem(data[index]),
              ),
            );
          },
        );
      },
    );
  }
}
