import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smartcommerce/pages/categories/sector_1.dart';
import 'package:smartcommerce/pages/categories/sector_2.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesSectorOne(),
        Divider(
          endIndent: 50,
          indent: 50,
          color: Colors.amber[700],
          height: 30,
        ),
        CategoriesSectorTwo(),
      ],
    );
  }
}
