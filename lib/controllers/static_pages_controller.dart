import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/models/static_pages_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class StaticPagesController extends GetxController {
  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));

  RxList<StaticPagesModel> staticPagesList = <StaticPagesModel>[].obs;
  RxBool loadingStaticPages = RxBool(false);

  getStaticPages() async {
    loadingStaticPages.value = true;
    List<StaticPagesModel> staticPages = await client.getStaticPages();
    staticPagesList.value = staticPages;
    loadingStaticPages.value = false;
  }
}
