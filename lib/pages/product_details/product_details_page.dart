import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final pages = [
    DescriptionPart(),
    ReviewsPart(),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(
        () => (contoller.loadingProductDetails.value)
            ? Center(child: circularProgress(context))
            : Scaffold(
                appBar: GlobalAppBar(),
                extendBody: true,
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
                        height: kToolbarHeight + 10,
                        width: MediaQuery.of(context).size.width * 0.40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).accentColor, width: 1.6),
                        ),
                        child: Text(contoller
                            .productDetails.value.sellingPrice.formatted),
                      ),
                      /*----------------------------------  Add to Cart  ------------------------------------*/
                      MaterialButton(
                        child: const Text("Add to Cart"),
                        color: Colors.red,
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
