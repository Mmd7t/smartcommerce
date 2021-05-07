import 'package:flutter/material.dart';
import 'package:smartcommerce/models/cart.dart';
import 'package:smartcommerce/widgets/custom_image.dart';

// ignore: must_be_immutable
class ShippingBagCard extends StatelessWidget {
  Cart product;
  ShippingBagCard({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 85,
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Stack(
        children: [
          cachedNetworkImage(product.imageUrl,
              height: 100.0, width: 80.0, boxFit: BoxFit.contain),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 15,
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.5),
                child: Center(
                  child: Text(
                    'x${product.cartQuantity}',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
