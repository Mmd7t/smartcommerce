import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/models/cupon.dart';
import 'package:smartcommerce/widgets/button.dart';
import 'package:smartcommerce/widgets/input_field.dart';
import 'package:smartcommerce/widgets/progress.dart';

class ApplyCoupon extends StatefulWidget {
  final Coupon coupon;
  final Function(Coupon) fun;
  @override
  _ApplyCouponState createState() => _ApplyCouponState();

  ApplyCoupon(this.coupon, this.fun);
}

class _ApplyCouponState extends State<ApplyCoupon> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool loading = false;
  String code;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Title(
                  color: Get.theme.primaryColor,
                  child: Text(
                    "coupons".tr,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              ListTile(
                title: (widget.coupon != null)
                    ? Text(
                        "coupon Title".tr +
                            " " +
                            widget.coupon.name[Get.locale.languageCode],
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            foreground: Paint()
                              ..shader = LinearGradient(colors: [
                                Colors.yellow[700],
                                Colors.yellow[800],
                                Colors.yellow[900],
                              ]).createShader(
                                  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                        textAlign: TextAlign.right,
                      )
                    : loading == true
                        ? Text("")
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: AppInput(
                              controller: controller,
                              hint: "coupon code".tr,
                              label: "coupon".tr,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              validator: (String val) {
                                if (val.length < 2) {
                                  return "enter valid code".tr;
                                } else {
                                  return null;
                                }
                              },
                              saver: (String val) {
                                code = val;
                              },
                            ),
                          ),
                subtitle: widget.coupon != null
                    ? Text(
                        "discount".tr +
                            " " +
                            widget.coupon.valueAmount.toString(),
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            foreground: Paint()
                              ..shader = LinearGradient(colors: [
                                Colors.yellow[700],
                                Colors.yellow[800],
                                Colors.yellow[900],
                              ]).createShader(
                                  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                        textAlign: TextAlign.right,
                      )
                    : null,
                trailing: widget.coupon == null
                    ? loading == true
                        ? Container(
                            width: 100,
                            child: Center(
                              child: circularDefaultProgress(context),
                            ),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: RegisterButton(
                              "check".tr,
                              () async {
                                if (key.currentState.validate()) {
                                  key.currentState.save();
                                  setState(() {
                                    loading = true;
                                  });
                                  Coupon newCoupon =
                                      await Get.put(CartController())
                                          .verifyCoupon(code);
                                  setState(() {
                                    loading = false;
                                  });
                                  widget.fun(newCoupon);
                                }
                              },
                              color: Get.theme.primaryColor,
                            ),
                          )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
