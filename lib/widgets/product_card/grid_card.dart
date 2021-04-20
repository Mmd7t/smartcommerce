import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/models/product_data.dart';

import '../global_image.dart';
import '../progress.dart';

class ProductGridItem extends StatelessWidget {
  final ProductData data;
  static const double radius = 10;
  final AuthController controller = Get.put(AuthController());
  final CartController cart = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child(
          context: context,
          img: "${data.baseImage}",
        ),
      ],
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Footer Function  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  footer({name, context, price}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        // padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
                endIndent: 20, indent: 20, height: 10, color: Colors.red),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                Text(
                  '$price',
                  style: Theme.of(context).textTheme.bodyText1,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => IconButton(
            icon: controller.wishListProcessList.contains(data.id) == true
                ? circularDefaultProgress(context, size: 15, color: Colors.red)
                : Icon(
                    controller.inFav(data.id) == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
            onPressed: () {
              controller.lookUpFav(data.id);
            },
          ),
        ),
        Obx(
          () => IconButton(
            icon: cart.cartProcessList.contains(data.id) == true
                ? circularDefaultProgress(context,
                    size: 15, color: Colors.amber[700])
                : Icon(
                    cart.checkInCart(data.id) == true
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                    color: Colors.amber[700],
                  ),
            onPressed: () async {
              if (cart.checkInCart(data.id)) {
                cart.removeItem(data.id);
              } else {
                cart.fromProductSmall(data);
              }
            },
          ),
        ),
      ],
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Child Function  -------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  child({context, img}) {
    return Container(
      padding: const EdgeInsets.all(10).copyWith(top: 30),
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
          header(context),
          SizedBox(
            width: 100,
            height: 100,
            child: GlobalImage.globalImage(img),
          ),
          footer(
            name: "${data.name}",
            context: context,
            price: "${data.formattedPrice.formatted}",
          ),
        ],
      ),
    );
  }

  ProductGridItem(this.data);
}
