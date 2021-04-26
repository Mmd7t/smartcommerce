import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/models/product_data.dart';
import '../custom_image.dart';
import '../progress.dart';

class ProductListItem extends StatelessWidget {
  final ProductData data;
  ProductListItem(this.data);
  final AuthController controller = Get.put(AuthController());
  final CartController cart = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leading(context: context, img: data.baseImage),
          const SizedBox(width: 10),
          title(
            name: data.name,
            context: context,
            price: data.formattedPrice.formatted,
          ),
          trailing(context),
          const SizedBox(width: 5),
        ],
      ),
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Footer Function  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  title({name, context, price}) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            const SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Header Function  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  trailing(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Child Function  -------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  leading({context, img}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Hero(
          tag: 'img',
          child: cachedNetworkImage(img,
              boxFit: BoxFit.fitHeight, height: 120.0, width: 100.0),
        ),
      ),
    );
  }
}
