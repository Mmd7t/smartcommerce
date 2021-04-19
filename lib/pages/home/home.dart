import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/pages/home/components/best_sales.dart';
import 'package:smartcommerce/pages/home/components/categories_list.dart';
import 'package:smartcommerce/pages/home/components/sliders.dart';
import 'package:smartcommerce/pages/search/search.dart';

import 'components/brands.dart';
import 'components/two_banners.dart';

class Home extends StatelessWidget {
  static const String routeName = 'home';
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          width: size.width,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5)
              .copyWith(bottom: 10),
          child: TextField(
            focusNode: focusNode,
            autocorrect: false,
            onTap: () async {
              await showSearch(context: context, delegate: Search());
              focusNode.unfocus();
            },
            decoration: InputDecoration(
              hintText: 'البحث'.tr,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        HomeCategoriesList(),
        Sliders(),
        Padding(
          padding: const EdgeInsets.all(15.0).copyWith(bottom: 8),
          child: Text(
            'الماركات',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline5.fontSize,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        HomeBrands(),
        TwoBanners(),
        HomeBestSales(),
      ],
    );
  }
}
