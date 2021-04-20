import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/models/flashsale_products_model.dart';
import 'package:smartcommerce/pages/product_details/product_details_page.dart';
import 'package:smartcommerce/widgets/custom_image.dart';
import 'package:smartcommerce/widgets/progress.dart';

class FlashSaleItem extends StatelessWidget {
  final FlashProduct product;
  static const double radius = 10;
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          splashColor: Theme.of(context).accentColor,
          onTap: () =>
              Navigator.of(context).pushNamed(ProductDetails.routeName),
          child: Card(
            elevation: 0.0,
            margin: const EdgeInsets.all(5.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Container(
              padding: const EdgeInsets.all(5).copyWith(top: 4),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2.0,
                    offset: Offset(0, 1),
                    color: Colors.black12,
                  )
                ],
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 800,
                          child: child(
                            context: context,
                            img: "${product.baseImage}",
                          ),
                        ),
                        header(
                          context,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: footer(
                        name: "${product.name}",
                        context: context,
                        price: "${product.price.formatted}",
                        product: product),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  footer({name, context, price, FlashProduct product}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                SizedBox(
                  height: 20.0,
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
                Row(
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
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.clip,
                      textDirection: TextDirection.rtl,
                      maxLines: 1,
                    ),
                  ],
                ),
                CountdownTimer(
                  widgetBuilder: (_, CurrentRemainingTime time) {
                    if (time == null) {
                      return Text('Game over');
                    }
                    return Text(
                        '${"remaining".tr} ${time.days} ${"days".tr} ${time.hours}:${time.min}:${time.sec}');
                  },
                  endTime:
                      product.pivot.endDate.toLocal().millisecondsSinceEpoch +
                          1000 * 30,
                  endWidget: Center(
                    child: Text("time expired".tr),
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
        IconButton(
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.amber[700],
          ),
          onPressed: () {},
        ),
      ],
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Child Function  -------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  child({context, img}) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: const Text(''),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            width: 70,
            height: 70,
          ),
          cachedNetworkImage(img)
        ],
      ),
    );
  }

  FlashSaleItem(this.product);
}
