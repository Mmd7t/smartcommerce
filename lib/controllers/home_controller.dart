import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:smartcommerce/models/brands_model.dart';
import 'package:smartcommerce/models/categories_model.dart';
import 'package:smartcommerce/models/flashsale_products_model.dart';
import 'package:smartcommerce/models/sliders_model.dart' hide Options;
import 'package:smartcommerce/models/two_banners_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class HomeController extends GetxController {
  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));
  RxList<CategoriesModel> featuredCategoriesList = <CategoriesModel>[].obs;

  RxList<SlidersModel> slidersList = <SlidersModel>[].obs;
  RxList<BrandsModel> brandsList = <BrandsModel>[].obs;
  Rx<TwoBannersModel> twoBannersModel = TwoBannersModel().obs;
  Rx<FlashSaleProductsModel> flashsaleProductsModel =
      FlashSaleProductsModel().obs;

  RxBool isFeaturedCatsLoading = false.obs;
  RxBool isSlidersLoading = false.obs;
  RxBool isBrandsLoading = false.obs;
  RxBool isTwoBannersLoading = false.obs;

  getFeaturedCategories() async {
    isFeaturedCatsLoading.value = true;
    List<CategoriesModel> listOfCats =
        await client.getHomeCategoriesList(Constants.basicAuth);
    featuredCategoriesList.addAll(listOfCats);
    isFeaturedCatsLoading.value = false;
  }

  getSliders() async {
    isSlidersLoading.value = true;
    List<SlidersModel> listOfSliders =
        await client.getSlidersList(Constants.basicAuth);
    slidersList.addAll(listOfSliders);
    isSlidersLoading.value = false;
  }

  getBrands() async {
    isBrandsLoading.value = true;
    List<BrandsModel> listOfBrands =
        await client.getBrandsList(Constants.basicAuth);
    brandsList.addAll(listOfBrands);
    isBrandsLoading.value = false;
  }

  getTwoBanners() async {
    isTwoBannersLoading.value = true;
    TwoBannersModel twoBanners =
        await client.getTwoBanners(Constants.basicAuth);
    twoBannersModel = twoBanners.obs;
    isTwoBannersLoading.value = false;
  }
}
