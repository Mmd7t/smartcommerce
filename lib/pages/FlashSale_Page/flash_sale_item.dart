import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/models/flashsale_products_model.dart';
import 'package:smartcommerce/widgets/custom_image.dart';
import 'package:smartcommerce/widgets/progress.dart';

class FlashSaleItem extends StatelessWidget {
  final FlashProduct product;
  FlashSaleItem(this.product);
  static const double radius = 8;
  final AuthController controller = Get.put(AuthController());
  final CartController cart = Get.put(CartController());
  final AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        splashColor: Color(appController.accentColor.value),
        // onTap: () =>
        //     Navigator.of(context).pushNamed(ProductDetails.routeName),
        child: Card(
          elevation: 2.5,
          margin: const EdgeInsets.all(5.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: child(
            context: context,
            img: "${product.baseImage}",
          ),
        ),
      ),
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Child Function  -------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  child({context, img}) {
    return Container(
      padding: const EdgeInsets.all(10).copyWith(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          header(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: cachedNetworkImage(img, boxFit: BoxFit.fitHeight),
            ),
          ),
          footer(
              name: "${product.name}",
              context: context,
              price: "${product.price.formatted}",
              product: product),
        ],
      ),
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Footer Function  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/

  footer({name, context, price, FlashProduct product}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              alignment: Alignment.center,
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    "${((double.parse(product.pivot.price.amount) / double.parse(product.price.amount)) * 100).ceil()}% OFF",
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.red),
                  ),
                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
                repeatForever: true,
              ),
            ),
            const Divider(
                endIndent: 20, indent: 20, height: 20, color: Colors.red),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AutoSizeText(
                    name,
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.clip,
                    textDirection: TextDirection.rtl,
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        product.price.formatted,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(decoration: TextDecoration.lineThrough),
                        overflow: TextOverflow.clip,
                        textDirection: TextDirection.rtl,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        product.pivot.price.formatted,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Color(appController.accentColor.value),
                              fontWeight: FontWeight.bold,
                            ),
                        overflow: TextOverflow.clip,
                        textDirection: TextDirection.rtl,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    color: Color(appController.primaryColor.value)
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CountdownTimer(
                    widgetBuilder: (_, CurrentRemainingTime time) {
                      if (time == null) {
                        return Text('Game over',
                            style: TextStyle(
                                color:
                                    Color(appController.primaryColor.value)));
                      }
                      return Text(
                          '${"remaining".tr} ${time.days} ${"days".tr} ${time.hours}:${time.min}:${time.sec}',
                          style: TextStyle(
                              color: Color(appController.primaryColor.value)));
                    },
                    endTime:
                        product.pivot.endDate.toLocal().millisecondsSinceEpoch +
                            1000 * 30,
                    endWidget: Center(
                      child: Text("time expired".tr),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Header Function  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  header(context) {
    // bool isAddedToCart = await CartDB().getDataById(data.id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => IconButton(
            icon: controller.wishListProcessList.contains(product.id) == true
                ? circularDefaultProgress(context, size: 15, color: Colors.red)
                : Icon(
                    controller.inFav(product.id) == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
            onPressed: () {
              controller.lookUpFav(product.id);
            },
          ),
        ),
        Obx(
          () => IconButton(
            icon: cart.cartProcessList.contains(product.id) == true
                ? circularDefaultProgress(context,
                    size: 15, color: Colors.amber[700])
                : Icon(
                    cart.checkInCart(product.id) == true
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                    color: Colors.amber[700],
                  ),
            onPressed: () async {
              if (cart.checkInCart(product.id)) {
                cart.removeItem(product.id);
              } else {
                cart.fromProductFlashSale(product);
              }
            },
          ),
        ),
      ],
    );
  }
}
