import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/address_provider.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/pages/addresses/user_address.dart';

class UserAddressDataWidget extends StatelessWidget {
  final AddressController address = Get.put(AddressController());
  final AuthController user = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (address.selectedAddress.phoneNumber.length <= 0) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: ListTile(
              title: Text(
                "addAddress".tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Theme.of(context).errorColor),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyAddressScreen(selective: true))),
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: ListTile(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      '${user.userProfileModel.value.firstName} ${user.userProfileModel.value.lastName}'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${address.selectedAddress.phoneNumber}',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Theme.of(context).textTheme.caption.color),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${address.selectedAddress.city}',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Theme.of(context).textTheme.caption.color),
                  ),
                  Text(
                    '${address.selectedAddress.addressLine}  ${address.selectedAddress.zipCode}',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Theme.of(context).textTheme.caption.color),
                  ),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyAddressScreen(selective: true))),
            ),
          ),
        );
      }
    });
  }
}
