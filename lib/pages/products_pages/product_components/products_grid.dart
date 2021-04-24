import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/models/product_data.dart';
import 'package:smartcommerce/pages/product_details/product_details_page.dart';
import 'package:smartcommerce/widgets/product_card/grid_card.dart';

class ProductsGrid extends StatelessWidget {
  static const double radius = 5;

  final List<ProductData> data;
  ProductsGrid(this.data);

  @override
  Widget build(BuildContext context) {
    print(data.length);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 3 / 4.2,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(ProductsGrid.radius),
          child: InkWell(
            onTap: () {
              print(data[index].id);
              print(Get.put(AuthController()).apiToken.value);
              Get.put(ProductsController()).getProductDetails(data[index].id);
              Get.toNamed(ProductDetails.routeName);
            },
            borderRadius: BorderRadius.circular(ProductsGrid.radius),
            splashColor: Theme.of(context).accentColor,
            child: ProductGridItem(data[index]),
          ),
        );
      },
    );
  }
}
