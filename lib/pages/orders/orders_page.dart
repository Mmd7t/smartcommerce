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
                        Card(
                          elevation: 2.5,
                          color: Theme.of(context).accentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
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
                        Card(
                          elevation: 2.5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
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
                                      horizontal: 35, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.16),
                                  ),
                                  child: Text(
                                    checkStatus(controller
                                        .userOrdersList[index].status),
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                    height: 30),
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
                                          '${controller.userOrdersList[index].discount.formatted}',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.12),
                                  ),
                                  child: Text(
                                    'Total'.tr +
                                        ' : ${controller.userOrdersList[index].total.formatted}',
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
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
