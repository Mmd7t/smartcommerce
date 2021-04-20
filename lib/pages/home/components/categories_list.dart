import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/category_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/pages/products_pages/products.dart';
import 'package:smartcommerce/widgets/global_image.dart';
import 'package:smartcommerce/widgets/progress.dart';

class HomeCategoriesList extends StatefulWidget {
  @override
  _HomeCategoriesListState createState() => _HomeCategoriesListState();
}

class _HomeCategoriesListState extends State<HomeCategoriesList> {
  final categoryController = Get.find<CategoryController>();
  ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 4 / 1.5,
      child: Container(
        width: size.width,
        alignment: Alignment.center,
        child: Obx(
          () => categoryController.fetchingMainCategories.value
              ? circularDefaultProgress(context)
              : ListView.builder(
                  itemCount: categoryController.categoriesParentList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.selectedFeaturedCatsProducts.value =
                                categoryController
                                    .categoriesParentList[index].id;
                            controller.getFeaturedCatsProducts();
                          });
                          Get.toNamed(ProductsByBrands.routeName);
                        },
                        child: Container(
                          width: size.width * 0.3,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                maxRadius: size.width * 0.11,
                                backgroundColor: Theme.of(context).primaryColor,
                                backgroundImage:
                                    GlobalImage.globalImageProvider(
                                        categoryController
                                            .categoriesParentList[index]
                                            .logo
                                            .path),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${categoryController.categoriesParentList[index].name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: Theme.of(context).accentColor),
                                maxLines: 3,
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
