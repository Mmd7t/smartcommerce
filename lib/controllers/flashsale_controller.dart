import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:smartcommerce/models/flashsale_products_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class FlashSaleController extends GetxController {
  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));
  Rx<FlashSaleProductsModel> flashSaleProductsModel;
  RxBool flashSaleLoading = RxBool(false);

  getFlashSaleProducts() async {
    flashSaleLoading.value = true;
    FlashSaleProductsModel flashSaleProducts =
        await client.getFlashSaleProducts(Constants.basicAuth);
    if (flashSaleProducts != null) {
      flashSaleProductsModel = flashSaleProducts.obs;
    }
    flashSaleLoading.value = false;
  }
}
