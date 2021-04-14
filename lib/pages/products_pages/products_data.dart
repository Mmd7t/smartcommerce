import 'package:flutter/material.dart';
import 'package:smartcommerce/pages/products_pages/products_grid.dart';

class ProductsData extends StatelessWidget {
  static const double radius = 10;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ProductsGrid(),
    );
  }
}
