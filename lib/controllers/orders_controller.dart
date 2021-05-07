import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/models/user_orders_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';

import 'auth_controller.dart';

class OrdersController extends GetxController {
  RestClient client = RestClient(
      Dio(BaseOptions(headers: Constants.headers, baseUrl: Constants.baseUrl)));

  RxList<UserOrdersModel> userOrdersList = <UserOrdersModel>[].obs;
  RxBool isLoading = false.obs;

  updateClient() {
    client = RestClient(Dio(
        BaseOptions(headers: Constants.headers, baseUrl: Constants.baseUrl)));
  }

  getOrders() async {
    isLoading.value = true;
    await AuthController().getToken();
    if (Get.put(AuthController()).apiToken.value != null) {
      List<UserOrdersModel> userOrders =
          await client.getUserOrders(Get.put(AuthController()).apiToken.value);
      userOrdersList.value = (userOrders);
    } else {
      print('errorrrrrrrrrrrrrrrrrrrrrr');
    }
    isLoading.value = false;
  }
}
