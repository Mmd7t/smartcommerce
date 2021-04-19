import 'package:flutter/material.dart';
import 'package:smartcommerce/models/flashsale_products_model.dart';

class FlashSaleItem extends StatelessWidget {
  final FlashProduct product;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(product.id.toString()),
    );
  }

  FlashSaleItem(this.product);
}
