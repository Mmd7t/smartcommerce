import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/products_controller.dart';

class DescriptionPart extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Html(
              data: "${controller.productDetails.value.description}",
            ),
          ],
        ),
      ),
    );
  }
}
