import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/controllers/cart_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';
import 'package:smartcommerce/pages/product_details/product_details_page.dart';
import 'package:smartcommerce/utils/helper/help.dart';
import 'package:smartcommerce/widgets/progress.dart';

import 'custom_image.dart';

class CartItem extends StatefulWidget {
  final int cartId;
  CartItem({Key key, @required this.cartId}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  CartController cart = Get.put(CartController());
  AuthController user = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = 190.0;
    return Column(
      children: <Widget>[
        Obx(
          () => Opacity(
            opacity: cart.checkIfOutOfStock(widget.cartId) ? 1 : 0.7,
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              height: _height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Dismissible(
                key: ValueKey(widget.cartId),
                background: Container(
                  color: Theme.of(context).accentColor.withOpacity(0.3),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.delete,
                    color: Theme.of(context).accentColor,
                    size: 40,
                  ),
                ),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async {
                  return await Helper.confirmDelete(
                      "removeConfirmation".tr, context);
                },
                onDismissed: (direction) {
                  cart.removeItem(widget.cartId);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    if (cart.getCart(widget.cartId).checking == true)
                      linearProgress(),
                    Expanded(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.put(ProductsController())
                                  .selectedProductDetails(widget.cartId);
                              Get.toNamed(ProductDetails.routeName);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0)),
                              child: SizedBox(
                                height: _height,
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: cachedNetworkImage(
                                    cart.getCart(widget.cartId).imageUrl,
                                    boxFit: BoxFit.contain),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 4.0,
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  cart.checkIfOutOfStock(widget.cartId)
                                      ? Container()
                                      : Text(
                                          "outOfStock".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .errorColor),
                                        ),
                                  Text(
                                    cart.getCart(widget.cartId).name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  Helper.getPrice(
                                    double.parse(cart
                                        .getCart(widget.cartId)
                                        .sellingPrice
                                        .amount),
                                    context,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                            color:
                                                Theme.of(context).accentColor)
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                          icon: Icon(
                                            cart
                                                        .getCart(widget.cartId)
                                                        .cartQuantity ==
                                                    1
                                                ? Icons.delete_outline
                                                : Icons.remove,
                                            size: 18,
                                          ),
                                          onPressed: cart.checkIfOutOfStock(
                                                  widget.cartId)
                                              ? () async {
                                                  if (cart
                                                          .getCart(
                                                              widget.cartId)
                                                          .cartQuantity >
                                                      1) {
                                                    cart.removeSinglePiece(
                                                        cart.getCart(
                                                            widget.cartId));
                                                  } else {
                                                    if (await Helper.confirmDelete(
                                                            "removeConfirmation"
                                                                .tr,
                                                            context) ==
                                                        true) {
                                                      cart.removeSinglePiece(
                                                          cart.getCart(
                                                              widget.cartId));
                                                    }
                                                  }
                                                }
                                              : null),
                                      Text(
                                        cart
                                            .getCart(widget.cartId)
                                            .cartQuantity
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add, size: 18),
                                        onPressed: cart.checkIfOutOfStock(
                                                widget.cartId)
                                            ? () {
                                                cart.updateCount(widget.cartId);
                                              }
                                            : null,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
