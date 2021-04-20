import 'package:get/get.dart';
import 'auth_controller.dart';

class OrdersController extends GetxController {
  getOrders() async {
    await AuthController().getToken();
  }
}
