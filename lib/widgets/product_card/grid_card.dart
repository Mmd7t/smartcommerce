import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/models/product_data.dart';
import '../custom_image.dart';
import '../progress.dart';

class ProductGridItem extends StatelessWidget {
  final ProductData data;
  ProductGridItem(this.data);
  static const double radius = 5;
  final AuthController controller = Get.put(AuthController());
  final CartController cart = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.5,
      child: child(
        context: context,
        img: "${data.baseImage}",
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
              child: Hero(
                tag: 'img',
                child: cachedNetworkImage(img, boxFit: BoxFit.fitHeight),
              ),
            ),
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

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Footer Function  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  footer({name, context, price}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                name,
                style: Theme.of(context).textTheme.bodyText1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const Divider(
                endIndent: 20, indent: 20, height: 12, color: Colors.red),
            Text(
              '$price',
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ],
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Header Function  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  header(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Hero(
          tag: 'favBtn',
          child: Obx(
            () => IconButton(
              icon: controller.wishListProcessList.contains(data.id) == true
                  ? circularDefaultProgress(context,
                      size: 15, color: Colors.red)
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
        ),
        Hero(
          tag: 'cartBtn',
          child: Obx(
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
        ),
      ],
    );
  }
}
