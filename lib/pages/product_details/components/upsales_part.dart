import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/pages/products_pages/product_components/products_grid.dart';

class UpSalesPart extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return ProductsGrid(controller.upSaleProduct);
  }
}
