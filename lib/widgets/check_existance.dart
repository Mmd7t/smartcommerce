import 'package:get/get.dart';
import 'package:smartcommerce/controllers/products_controller.dart';

checkExisting() {
  final controller = Get.find<ProductsController>();
  if (controller.productDetails.value.inStock) {
    if (controller.productDetails.value.manageStock) {
      if (controller.productDetails.value.qty != null &&
          controller.productDetails.value.qty != 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  } else {
    return false;
  }
}
