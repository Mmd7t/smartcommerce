import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/models/cart.dart';
import 'package:smartcommerce/widgets/custom_image.dart';

shippingBagDetailsMBS(
    {@required BuildContext context, @required List<Cart> products}) async {
  return showModalBottomSheet(
    context: context,
    elevation: 5,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).primaryColor,
    builder: (context) => Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "shippingBag".tr,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Theme.of(context).textTheme.caption.color),
                  ),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop()),
                ],
              ),
              Container(
                height: products.length * 100.0,
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          color: Colors.white,
                          child: ListTile(
                            leading: cachedNetworkImage(
                                products[index].imageUrl,
                                height: 100.0,
                                width: 80.0),
                            title: Text(products[index].name),
                            subtitle: Row(
                              children: [
                                Text(
                                  products[index].sellingPrice.formatted,
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor),
                                ),
                                Spacer(),
                                Text('x${products[index].cartQuantity}',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor)),
                              ],
                            ),
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
