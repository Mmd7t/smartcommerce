import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/models/product_data.dart';
import 'package:smartcommerce/pages/product_details/product_details_page.dart';
import 'package:smartcommerce/widgets/product_card/list_card.dart';

class ProductsList extends StatelessWidget {
  static const double radius = 10;
  final List<ProductData> data;
  ProductsList(this.data);
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 150),
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 500),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  splashColor: Theme.of(context).primaryColor,
                  onTap: () {
                    print(data[index].id);
                    print(Get.put(AuthController()).apiToken.value);
                    Get.put(ProductsController())
                        .getProductDetails(data[index].id);
                    Get.toNamed(ProductDetails.routeName);
                  },
                  child: ProductListItem(data[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
