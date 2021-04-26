import 'package:get/get.dart';

class AppController extends GetxController {
  RxBool isGrid = true.obs;
  RxBool isObscure = false.obs;

  changeView() {
    isGrid.value = !isGrid.value;
  }

  changeObscure() {
    isObscure.value = !isObscure.value;
  }
}
