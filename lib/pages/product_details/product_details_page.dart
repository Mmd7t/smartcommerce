import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';
import 'package:smartcommerce/widgets/progress.dart';
import 'description_part.dart';
import 'header_part.dart';
import 'reviews_part.dart';
import 'sticky_header.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = 'productDetails';
  final contoller = Get.find<ProductsController>();
  final pages = [DescriptionPart(), ReviewsPart()];
  final AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(
        () => (contoller.loadingProductDetails.value)
            ? Center(child: circularProgress(context))
            : Scaffold(
                appBar: GlobalAppBar(),
                body: DefaultTabController(
                  length: 2,
                  child: NestedScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    headerSliverBuilder: (context, isScolled) {
                      return [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.white,
                          collapsedHeight:
                              MediaQuery.of(context).size.height * 0.45,
                          expandedHeight:
                              MediaQuery.of(context).size.height * 0.45,
                          flexibleSpace: HeaderPart(),
                        ),
                        StickyHeader(),
                      ];
                    },
                    body: TabBarView(children: pages),
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: kToolbarHeight - 4,
                        width: MediaQuery.of(context).size.width * 0.40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(appController.primaryColor.value)
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          contoller.productDetails.value.sellingPrice.formatted,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Color(appController.accentColor.value),
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ),
                      /*----------------------------------  Add to Cart  ------------------------------------*/
                      MaterialButton(
                        child: const Text("Add to Cart"),
                        elevation: 0,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: Color(appController.accentColor.value),
                        onPressed: () {},
                        height: 50,
                        minWidth: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
