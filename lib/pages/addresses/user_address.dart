import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/address_provider.dart';
import 'package:smartcommerce/utils/helper/help.dart';
import 'package:smartcommerce/widgets/empty/emptyAddress.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';

import 'new_shipping_address.dart';

class MyAddressScreen extends GetView<AddressController> {
  static const String routeName = 'MyAddressScreen';

  final selective;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "MyAddressScreen".tr,
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: controller.addresses.length == 0
                  ? Center(
                      child: EmptyAddress(),
                    )
                  : ListView.builder(
                      itemCount: controller.addresses.length,
                      itemBuilder: (context, index) => Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Dismissible(
                              key: ValueKey(
                                controller.addresses[index].id,
                              ),
                              background: Container(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.3),
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
                                    "removeAddressConfirmation".tr, context);
                              },
                              onDismissed: (direction) {
                                controller
                                    .removeAddress(controller.addresses[index]);
                              },
                              child: Card(
                                color: controller.selectedAddress ==
                                        controller.addresses[index]
                                    ? Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1)
                                    : Colors.white,
                                child: ListTile(
                                  title: Text(controller.addresses[index].city),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(controller
                                          .addresses[index].addressLine),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              '${"houseNumber".tr}: ${controller.addresses[index].houseNumber}'),
                                          Text(
                                              '${"zipCode".tr}: ${controller.addresses[index].zipCode}'),
                                        ],
                                      ),
                                      Text(controller
                                          .addresses[index].phoneNumber),
                                    ],
                                  ),
                                  onTap: () {
                                    controller.selectedAddress =
                                        controller.addresses[index];
                                    if (selective) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          // IconButton(
                          //   icon: Icon(Icons.close),
                          //   color: Colors.red,
                          //   onPressed: () {},
                          // ),
                        ],
                      ),
                    ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("addShippingAddress".tr),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(color: Theme.of(context).primaryColor),
                  primary: Theme.of(context).accentColor,
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewShippingAddress())),
              ),
            )
          ],
        ),
      ),
    );
  }

  MyAddressScreen({this.selective = false});
}
