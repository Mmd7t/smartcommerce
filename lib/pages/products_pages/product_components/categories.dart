import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/category_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';

class ProductsCategories extends StatefulWidget {
  @override
  _ProductsCategoriesState createState() => _ProductsCategoriesState();
}

class _ProductsCategoriesState extends State<ProductsCategories> {
  int choiceIndex;
  final categoryController = Get.put(CategoryController());
  final productController = Get.put(ProductsController());

  @override
  void initState() {
    choiceIndex = categoryController
            .subCategoriesListCategoryIndex(
                productController.selectedCategory.value)
            .indexWhere((element) =>
                element.id == productController.selectedCategoryProduct.value) +
        1;

    print(categoryController
        .subCategoriesListCategoryIndex(
            productController.selectedCategory.value)
        .indexWhere((element) =>
            element.id == productController.selectedCategoryProduct.value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AspectRatio(
        aspectRatio: 16 / 2,
        child: Container(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              categoryController
                      .subCategoriesListCategoryIndex(
                          productController.selectedCategory.value)
                      .length +
                  1,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  shadowColor: Colors.transparent,
                  pressElevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: Text(
                    (index == 0)
                        ? 'all'.tr
                        : categoryController
                            .subCategoriesListCategoryIndex(productController
                                .selectedCategory.value)[index - 1]
                            .name,
                  ),
                  selected: choiceIndex == index,
                  side: (choiceIndex == index)
                      ? BorderSide(
                          color: Theme.of(context).accentColor, width: 1.5)
                      : BorderSide.none,
                  selectedColor: Theme.of(context).accentColor,
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.15),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: (choiceIndex == index)
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
                  labelPadding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  onSelected: (value) {
                    if (index == 0) {
                      productController.selectedCategoryProduct.value =
                          productController.selectedCategory.value;
                    } else {
                      productController.selectedCategoryProduct.value =
                          categoryController
                              .subCategoriesListCategoryIndex(productController
                                  .selectedCategory.value)[index - 1]
                              .id;
                    }
                    productController.getSelectedCategoryProducts();

                    setState(() {
                      choiceIndex = value ? index : null;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
