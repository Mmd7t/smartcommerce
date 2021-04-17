import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:smartcommerce/models/flashsale_products_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class FlashsaleController extends GetxController {
  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));
  Rx<FlashsaleProductsModel> flashsaleProductsModel =
      FlashsaleProductsModel().obs;

  @override
  void onInit() {
    super.onInit();
    getFlashsaleProducts();
  }

  getFlashsaleProducts() async {
    FlashsaleProductsModel flashsaleProducts =
        await client.getFlashsaleProducts(Constants.basicAuth);
    flashsaleProductsModel = flashsaleProducts.obs;
    return flashsaleProductsModel;
  }
}
