import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:smartcommerce/models/flashsale_products_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class FlashSaleController extends GetxController {
  RestClient client = RestClient(
      Dio(BaseOptions(headers: Constants.headers, baseUrl: Constants.baseUrl)));
  Rx<FlashSaleProductsModel> flashSaleProductsModel;
  RxBool flashSaleLoading = RxBool(false);

  updateClient() {
    client = RestClient(Dio(
        BaseOptions(headers: Constants.headers, baseUrl: Constants.baseUrl)));
  }

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
