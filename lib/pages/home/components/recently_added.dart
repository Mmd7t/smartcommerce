import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/home_controller.dart';
import 'package:smartcommerce/pages/products_pages/products.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/widgets/product_card/grid_card.dart';
import 'package:smartcommerce/widgets/progress.dart';

class RecentlyAdded extends StatefulWidget {
  @override
  _RecentlyAddedState createState() => _RecentlyAddedState();
}

class _RecentlyAddedState extends State<RecentlyAdded> {
  final HomeController homeController = Get.find<HomeController>();
  final AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          width: size.width * 0.8,
          alignment: Alignment.center,
          child: Text(
            'recentlyAdded'.tr,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Color(appController.accentColor.value),
                ),
          ),
        ),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 6 / 4.5,
          child: Container(
            width: size.width,
            alignment: Alignment.center,
            child: Obx(
              () => (homeController.isRecentlyAddedLoading.value)
                  ? circularDefaultProgress(context, size: 40.0)
                  : ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 3) {
                          return Container(
                            width: size.width * 0.4,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(ProductsPage.routeName,
                                    arguments: ProductsType.recently);
                              },
                              child: Card(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 50),
                                color: Theme.of(context).primaryColor,
                                child: Center(
                                    child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_back_ios_rounded),
                                      Text('Show More'.tr),
                                    ],
                                  ),
                                )),
                              ),
                            ),
                          );
                        }
                        return Container(
                          width: size.width * 0.5,
                          child: ProductGridItem(homeController
                              .recentlyAddedModel.value.products.data[index]),
                        );
                      },
                    ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
