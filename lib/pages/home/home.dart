import 'package:flutter/material.dart';
import 'package:smartcommerce/pages/home/best_sellers.dart';
import 'package:smartcommerce/pages/home/categories_list.dart';
import 'package:smartcommerce/pages/home/sliders.dart';

import 'brands.dart';
import 'two_banners.dart';

class Home extends StatelessWidget {
  static const String routeName = 'home';

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
            decoration: InputDecoration(
              hintText: 'البحث',
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
