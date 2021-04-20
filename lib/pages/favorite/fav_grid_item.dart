import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/models/user_profile_model.dart';
import 'package:smartcommerce/widgets/global_image.dart';
import 'package:smartcommerce/widgets/progress.dart';

class FavGridItem extends StatelessWidget {
  final Wishlist data;
  final AuthController controller = Get.put(AuthController());
  static const double radius = 10;
  final CartController cart = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GridTile(
/*------------------------------------------------------------------------------*/
/*----------------------------------  Footer  ----------------------------------*/
/*------------------------------------------------------------------------------*/
      footer: footer(
        name: "${data.name}",
        context: context,
        price: "${data.price.formatted}",
      ),
/*------------------------------------------------------------------------------*/
/*----------------------------------  Header  ----------------------------------*/
/*------------------------------------------------------------------------------*/
      header: header(context),
/*------------------------------------------------------------------------------*/
/*----------------------------------  Child  -----------------------------------*/
/*------------------------------------------------------------------------------*/
      child: child(
        context: context,
        img: "${data.baseImage}",
      ),
    );
  }

/*-----------------------------------------------------------------------------------------------------*/
/*----------------------------------------  Footer Function  ------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------*/
  footer({name, context, price}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
                endIndent: 20, indent: 20, height: 20, color: Colors.red),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.clip,
                    textDirection: TextDirection.rtl,
                  ),
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
    // bool isAddedToCart = await CartDB().getDataById(data.id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => IconButton(
            icon: controller.wishListProcessList.contains(data.id) == true
                ? circularDefaultProgress(context, size: 15, color: Colors.red)
                : Icon(
                    Icons.close,
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
                cart.addFromFav(data);
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
    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.all(5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Container(
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
            GlobalImage.globalImage(img),
          ],
        ),
      ),
    );
  }

  FavGridItem(this.data);
}
