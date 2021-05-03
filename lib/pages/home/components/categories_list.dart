import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
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
  final AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 4 / 1.6,
      child: Container(
        width: size.width,
        alignment: Alignment.center,
        child: Obx(
          () => categoryController.fetchingMainCategories.value
              ? circularDefaultProgress(context, size: 40.0)
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
                          Get.toNamed(ProductsPage.routeName);
                        },
                        child: Container(
                          width: size.width * 0.22,
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: size.width * 0.22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        Color(appController.primaryColor.value),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: GlobalImage.globalImageProvider(
                                        categoryController
                                            .categoriesParentList[index]
                                            .logo
                                            .path,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '${categoryController.categoriesParentList[index].name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                          color: Color(
                                              appController.accentColor.value)),
                                  maxLines: 3,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                ),
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
