import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/pages/main_page.dart';
import 'package:smartcommerce/utils/helper/default_helper.dart';

class OrderSubmit extends StatefulWidget {
  final subTotal;
  final shippingFee;
  final discount;
  final total;
  @override
  _OrderSubmitState createState() => _OrderSubmitState();

  OrderSubmit(
      {this.subTotal = 0,
      this.shippingFee = 0,
      this.discount = 0,
      this.total = 0});
}

class _OrderSubmitState extends State<OrderSubmit> {
  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(MainPage.routeName);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            color: Color(appController.accentColor.value),
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.offAllNamed(MainPage.routeName),
          ),
          title: Text("confirmation".tr),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.check_circle_outline,
                      color: Color(appController.accentColor.value),
                      size: 80.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "orderHasBeenSubmitted".tr,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "orderSubmit".tr,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.1)),
                      child: Column(
                        children: <Widget>[
                          BuildTextRowWidget(
                            title: "subTotal".tr,
                            subTitle: widget.subTotal,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          BuildTextRowWidget(
                            title: "shippingFee".tr,
                            subTitle: widget.shippingFee,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          BuildTextRowWidget(
                            title: "discount".tr,
                            subTitle: widget.discount,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          BuildTextRowWidget(
                            title: "total".tr,
                            subTitle: widget.total,
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: TextButton(
                onPressed: () => Get.offAllNamed(MainPage.routeName),
                child: Text(
                  "continueShopping".tr,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Color(appController.primaryColor.value)),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color(appController.accentColor.value)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildTextRowWidget extends StatefulWidget {
  BuildTextRowWidget(
      {@required this.title,
      @required this.subTitle,
      this.negative = '',
      this.textStyle = const TextStyle(fontSize: 14.0)});
  final String negative;
  final String title;
  final double subTitle;
  final TextStyle textStyle;

  @override
  _BuildTextRowWidgetState createState() => _BuildTextRowWidgetState();
}

class _BuildTextRowWidgetState extends State<BuildTextRowWidget> {
  final AppController appController = Get.put(AppController());

  @override
  void initState() {
    Timer(Duration(milliseconds: 300), () {
      Get.put(CartController()).clearAll();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          widget.title,
          style: widget.textStyle,
        ),
        Helper.getPrice(
          widget.subTitle,
          context,
          "",
          style: widget.textStyle
              .copyWith(color: Color(appController.accentColor.value)),
        ),
      ],
    );
  }
}
