import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/address_provider.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/models/cupon.dart';
import 'package:smartcommerce/utils/helper/cart_calculator.dart';
import 'package:smartcommerce/utils/helper/default_helper.dart';
import 'package:smartcommerce/widgets/progress.dart';

import 'order_confirmation_data/apply_coupon.dart';
import 'order_confirmation_data/payment_method.dart';
import 'order_confirmation_data/shopping_bag.dart';
import 'order_confirmation_data/user_address_data_widget.dart';
import 'order_submit.dart';

class CheckoutScreen extends StatefulWidget {
  static const String routeName = 'CheckoutScreen';

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  CartController cart = Get.put(CartController());
  AuthController user = Get.put(AuthController());
  AddressController address = Get.put(AddressController());
  AppController app = Get.put(AppController());
  Coupon coupon;
  @override
  void initState() {
    super.initState();
    app.getShippingFees();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          return cart.sendingOrder.value == false;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Get.theme.accentColor,
            title: Text("orderConfirmation".tr),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop()),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: app.loadingShippingFees.value == true
                ? Center(
                    child: circularDefaultProgress(context),
                  )
                : Stack(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        padding:
                            EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                        children: [
                          UserAddressDataWidget(),
                          PaymentMethod(),
                          ApplyCoupon(coupon, (Coupon newCoupon) {
                            if (newCoupon == null) {
                              Helper.showToast("coupon invalid".tr, context);
                            } else if (newCoupon.startDate
                                    .isAfter(DateTime.now()) &&
                                newCoupon.endDate.isBefore(DateTime.now())) {
                              Helper.showToast(
                                  "coupon time expired".tr, context);
                            } else if (newCoupon.minimumSpendAmount >
                                cart.totalPrice) {
                              Helper.showToast(
                                  "coupon in applicaple".tr, context);
                            } else {
                              setState(() {
                                coupon = newCoupon;
                              });
                            }
                          }),
                          ShoppingBag(
                            shippingFee: Calculator.getShippingFees(
                              freeShippingCoupon:
                                  coupon != null ? coupon.freeShipping : false,
                              total: cart.totalPrice,
                              freeSippingEnabled:
                                  app.shippingFee.value.freeShippingEnabled,
                              freeShippingMinimum:
                                  app.shippingFee.value.freeMinimumShipping,
                              nonFreeShipping:
                                  app.shippingFee.value.flatRateCost,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 1,
                        left: 1,
                        right: 1,
                        child: Material(
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${"total".tr}: ',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .accentColor
                                              .withOpacity(0.8)),
                                    ),
                                    Helper.getPrice(
                                      Calculator.getTotal(
                                        freeShippingCoupon: coupon != null
                                            ? coupon.freeShipping
                                            : false,
                                        discount: coupon != null
                                            ? coupon.valueAmount
                                            : 0.0,
                                        total: cart.totalPrice,
                                        freeSippingEnabled: app.shippingFee
                                            .value.freeShippingEnabled,
                                        percentageDiscount: coupon != null
                                            ? coupon.isPercentage == 1
                                            : false,
                                        freeShippingMinimum: app.shippingFee
                                            .value.freeMinimumShipping,
                                        nonFreeShipping:
                                            app.shippingFee.value.flatRateCost,
                                      ),
                                      context,
                                      cart.cartData.first.sellingPrice
                                          .inCurrentCurrency.currency,
                                      style: TextStyle(
                                          color: Color(app.accentColor.value)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  child: FlatButton(
                                    disabledColor: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.6),
                                    onPressed: cart.sendingOrder.value
                                        ? null
                                        : () async {
                                            if (address.selectedAddress.id ==
                                                0) {
                                              Helper.showToast(
                                                  "selectAddressFirst".tr,
                                                  context);
                                              return;
                                            } else {
                                              bool result =
                                                  await cart.sendOrder(
                                                address.selectedAddress,
                                                coupon,
                                                user.userProfileModel.value,
                                                Calculator.getShippingFees(
                                                  freeShippingCoupon:
                                                      coupon != null
                                                          ? coupon.freeShipping
                                                          : false,
                                                  total: cart.totalPrice,
                                                  freeSippingEnabled: app
                                                      .shippingFee
                                                      .value
                                                      .freeShippingEnabled,
                                                  freeShippingMinimum: app
                                                      .shippingFee
                                                      .value
                                                      .freeMinimumShipping,
                                                  nonFreeShipping: app
                                                      .shippingFee
                                                      .value
                                                      .flatRateCost,
                                                ),
                                                Calculator.getTotal(
                                                  freeShippingCoupon:
                                                      coupon != null
                                                          ? coupon.freeShipping
                                                          : false,
                                                  discount: coupon != null
                                                      ? coupon.valueAmount
                                                      : 0.0,
                                                  total: cart.totalPrice,
                                                  freeSippingEnabled: app
                                                      .shippingFee
                                                      .value
                                                      .freeShippingEnabled,
                                                  percentageDiscount: coupon !=
                                                          null
                                                      ? coupon.isPercentage == 1
                                                      : false,
                                                  freeShippingMinimum: app
                                                      .shippingFee
                                                      .value
                                                      .freeMinimumShipping,
                                                  nonFreeShipping: app
                                                      .shippingFee
                                                      .value
                                                      .flatRateCost,
                                                ),
                                              );
                                              if (result == true) {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        OrderSubmit(
                                                      shippingFee: Calculator
                                                          .getShippingFees(
                                                        freeShippingCoupon:
                                                            coupon != null
                                                                ? coupon
                                                                    .freeShipping
                                                                : false,
                                                        total: cart.totalPrice,
                                                        freeSippingEnabled: app
                                                            .shippingFee
                                                            .value
                                                            .freeShippingEnabled,
                                                        freeShippingMinimum: app
                                                            .shippingFee
                                                            .value
                                                            .freeMinimumShipping,
                                                        nonFreeShipping: app
                                                            .shippingFee
                                                            .value
                                                            .flatRateCost,
                                                      ),
                                                      total:
                                                          Calculator.getTotal(
                                                        freeShippingCoupon:
                                                            coupon != null
                                                                ? coupon
                                                                    .freeShipping
                                                                : false,
                                                        discount: coupon != null
                                                            ? coupon.valueAmount
                                                            : 0.0,
                                                        total: cart.totalPrice,
                                                        freeSippingEnabled: app
                                                            .shippingFee
                                                            .value
                                                            .freeShippingEnabled,
                                                        percentageDiscount:
                                                            coupon != null
                                                                ? coupon.isPercentage ==
                                                                    1
                                                                : false,
                                                        freeShippingMinimum: app
                                                            .shippingFee
                                                            .value
                                                            .freeMinimumShipping,
                                                        nonFreeShipping: app
                                                            .shippingFee
                                                            .value
                                                            .flatRateCost,
                                                      ),
                                                      subTotal: cart.totalPrice,
                                                      discount: coupon != null
                                                          ? coupon.valueAmount
                                                          : 0.0,
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                Helper.showToast(
                                                    "sendOrderError".tr,
                                                    context);
                                              }
                                            }
                                          },
                                    child: cart.sendingOrder.value
                                        ? Center(
                                            child: circularDefaultProgress(
                                                context),
                                          )
                                        : Text(
                                            'confirm'.tr,
                                            style: TextStyle(
                                                color: Color(
                                                    app.primaryColor.value),
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                    color: Color(app.accentColor.value),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
