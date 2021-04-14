import 'package:get/get.dart';

class MainPageController extends GetxController {
  var currentPage = 0.obs;

  changeCurrentPage(value) {
    currentPage = value;
  }
}
