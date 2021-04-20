import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smartcommerce/controllers/orders_controller.dart';
import 'package:smartcommerce/models/user_orders_model.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';
import 'package:smartcommerce/widgets/progress.dart';

class OrdersPage extends StatelessWidget {
  static const String routeName = 'ordersPage';

  final controller = Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: 'All Orders'.tr),
      body: Obx(
        () => (controller.isLoading.value)
            ? circularDefaultProgress(context)
            : ListView.builder(
                itemCount: controller.userOrdersList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 2,
                            color:
                                Theme.of(context).accentColor.withOpacity(0.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15)),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Order No".tr +
                                      ': ${controller.userOrdersList[index].id}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Ordered Date'.tr +
                                      ' : ${DateFormat.yMd().format(controller.userOrdersList[index].createdAt)}',
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.amber[700],
                                  ),
                                  child: Text(
                                    checkStatus(controller
                                        .userOrdersList[index].status),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('addressLine'.tr),
                                        const SizedBox(height: 8),
                                        Text(
                                            '${controller.userOrdersList[index].billingCity}'),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('zipCode'.tr),
                                        const SizedBox(height: 8),
                                        Text(
                                            '${controller.userOrdersList[index].billingZip}'),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                  endIndent: 20,
                                  indent: 20,
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Payment Method'.tr),
                                        const SizedBox(height: 8),
                                        Text(controller.userOrdersList[index]
                                            .paymentMethod),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('discount'.tr),
                                        const SizedBox(height: 8),
                                        Text(
                                            '${controller.userOrdersList[index].discount.formatted}'),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text('Total'.tr +
                                    ' : ${controller.userOrdersList[index].total.formatted}'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

  checkStatus(Status status) {
    switch (status) {
      case Status.PENDING_PAYMENT:
        return 'Pending Payment'.tr;
      case Status.PENDING:
        return 'Pending'.tr;
      case Status.COMPLETED:
        return 'Completed'.tr;
      case Status.CANCELED:
        return 'Canceled'.tr;
      case Status.PROCESSING:
        return 'Processing'.tr;
      default:
        return '';
    }
  }
}
