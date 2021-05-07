import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/models/cupon.dart';
import 'package:smartcommerce/pages/cart/order_confirmation_data/shipping_bag_card.dart';
import 'package:smartcommerce/pages/cart/order_confirmation_data/shipping_bag_details_MBS.dart';
import 'package:smartcommerce/utils/helper/default_helper.dart';

class ShoppingBag extends StatelessWidget {
  final double shippingFee;
  final Coupon coupon;
  ShoppingBag({this.shippingFee, this.coupon});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: CartController(),
      builder: (CartController products) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("shippingBag".tr),
                      Text(
                        '${products.cartData.length} ${"items".tr}',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                      height: 100,
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: products.cartData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ShippingBagCard(
                          product: products.cartData[index],
                        ),
                      ),
                    ),
                    onTap: () => shippingBagDetailsMBS(
                        context: context, products: products.cartData),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("subTotal".tr),
                      Helper.getPrice(
                        products.totalPrice,
                        context,
                        products.cartData.first.sellingPrice.currency,
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (coupon != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("discount".tr),
                        coupon.isPercentage != 1
                            ? Helper.getPrice(
                                coupon.valueAmount,
                                context,
                                products.cartData.first.sellingPrice.currency,
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              )
                            : Text('${coupon.value.toString()} %',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                      ],
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("shippingFee".tr),
                      if (shippingFee != 0)
                        Helper.getPrice(
                          shippingFee,
                          context,
                          products.cartData.first.sellingPrice.currency,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        )
                      else
                        Text(
                          "freeShipping".tr,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
