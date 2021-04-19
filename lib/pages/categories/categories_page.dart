import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/category_controller.dart';
import 'package:smartcommerce/pages/categories/sector_1.dart';
import 'package:smartcommerce/pages/categories/sector_2.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int currentPage = 0;

  @override
  void initState() {
    CategoryController controller = Get.put(CategoryController());
    controller.selectedSubCategories.value =
        controller.categoriesParentList[0].id;
    controller.getSelectedSubCategories();
    super.initState();
  }

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
