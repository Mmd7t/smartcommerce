import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/flashsale_controller.dart';
import 'package:smartcommerce/widgets/progress.dart';

import 'flash_sale_item.dart';

class FlashSalePage extends StatefulWidget {
  @override
  _FlashSalePageState createState() => _FlashSalePageState();
}

class _FlashSalePageState extends State<FlashSalePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX(
        init: FlashSaleController(),
        builder: (FlashSaleController controller) =>
            controller.flashSaleLoading.value == true
                ? circularDefaultProgress(context)
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: null),
                    itemBuilder: (context, index) => FlashSaleItem(controller
                        .flashSaleProductsModel.value.flashProducts[index])),
      ),
    );
  }
}
