import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class AuthController extends GetxController {
  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));

  @override
  void onInit() {
    super.onInit();
  }
}
