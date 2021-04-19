import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/models/user_profile_model.dart';
import 'package:smartcommerce/pages/products_pages/product_details/product_details_page.dart';

import 'fav_grid_item.dart';

class FavGrid extends StatelessWidget {
  static const double radius = 10;

  final List<Wishlist> data;
  FavGrid(this.data);

  @override
  Widget build(BuildContext context) {
    print(data.length);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 5,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(FavGrid.radius),
          child: InkWell(
            onTap: () {
              print(data[index].id);
              print(Get.put(AuthController()).apiToken.value);
              Get.put(ProductsController()).getProductDetails(data[index].id);
              Get.toNamed(ProductDetails.routeName);
            },
            borderRadius: BorderRadius.circular(FavGrid.radius),
            splashColor: Theme.of(context).accentColor,
            child: FavGridItem(data[index]),
          ),
        );
      },
    );
  }
}
