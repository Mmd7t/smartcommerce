import 'package:flutter/material.dart';
import 'package:smartcommerce/pages/products_pages/product_components/categories.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';

import 'product_components/products_data.dart';
import 'product_components/section2.dart';

class ProductsByBrands extends StatelessWidget {
  static const String routeName = 'Products';
  @override
  Widget build(BuildContext context) {
    var type = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: GlobalAppBar(),
      body: Column(
        children: [
/*-----------------------------------  Categories  ----------------------------------*/
          if (type == ProductsType.category) ProductsCategories(),
          const SizedBox(height: 10),
/*-----------------------------------  Section 2  -----------------------------------*/
          ProductsSection2(),
/*------------------------------------  Products  -----------------------------------*/
          Expanded(child: ProductsData(type: type)),
        ],
      ),
    );
  }
}
