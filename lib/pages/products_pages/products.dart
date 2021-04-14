import 'package:flutter/material.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';

import 'categories.dart';
import 'products_data.dart';
import 'section2.dart';

class Products extends StatelessWidget {
  static const String routeName = 'Products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(),
      body: Column(
        children: [
/*-----------------------------------  Categories  ----------------------------------*/
          ProductsCategories(),
          const SizedBox(height: 10),
/*-----------------------------------  Section 2  -----------------------------------*/
          ProductsSection2(),
/*------------------------------------  Products  -----------------------------------*/
          Expanded(child: ProductsData()),
        ],
      ),
    );
  }
}
