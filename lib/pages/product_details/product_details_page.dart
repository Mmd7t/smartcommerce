import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/pages/product_details/components/cross_sales_part.dart';
import 'package:smartcommerce/pages/product_details/components/related_sales_part.dart';
import 'package:smartcommerce/pages/product_details/components/upsales_part.dart';
import 'package:smartcommerce/utils/helper/default_helper.dart';
import 'package:smartcommerce/widgets/check_existance.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';
import 'package:smartcommerce/widgets/progress.dart';

import 'components/description_part.dart';
import 'components/header_part.dart';
import 'components/reviews_part.dart';
import 'components/sticky_header.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = 'productDetails';
  final int id;
  final contoller = Get.find<ProductsController>();

  final AppController appController = Get.find<AppController>();

  ProductDetails({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pages = [
      DescriptionPart(),
      ReviewsPart(id),
      CrossSalesPart(),
      UpSalesPart(),
      RelatedSalesPart(),
    ];
    return Material(
      child: Obx(
        () => (contoller.loadingProductDetails.value)
            ? Center(child: circularProgress(context))
            : Scaffold(
                appBar: GlobalAppBar(),
                body: DefaultTabController(
                  length: 5,
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
                      GetX(
                        init: CartController(),
                        builder: (CartController cartController) =>
                            MaterialButton(
                          child: Text(cartController.checkInCart(
                                  contoller.productDetails.value.id)
                              ? "In Cart".tr
                              : "Add to Cart".tr),
                          elevation: 0,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          color: Color(appController.accentColor.value),
                          onPressed: () {
                            if (cartController.checkInCart(
                                contoller.productDetails.value.id)) {
                              Helper.showToast("Already In Cart".tr, context);
                            } else {
                              if (checkExisting()) {
                                cartController.fromProduct(
                                    contoller.productDetails.value);
                              }
                            }
                          },
                          height: 50,
                          minWidth: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
