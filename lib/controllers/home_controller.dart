import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:smartcommerce/models/brands_model.dart';
import 'package:smartcommerce/models/categories_model.dart';
import 'package:smartcommerce/models/sliders_model.dart' hide Options;
import 'package:smartcommerce/models/two_banners_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class HomeController extends GetxController {
  Dio dio = Dio();

  RxList<CategoriesModel> categoriesList = <CategoriesModel>[].obs;
  RxList<SlidersModel> slidersList = <SlidersModel>[].obs;
  RxList<BrandsModel> brandsList = <BrandsModel>[].obs;
  Rx<TwoBannersModel> twoBannersModel = TwoBannersModel().obs;

  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getSliders();
    getBrands();
    getTwoBanners();
  }

  getCategories() async {
    List<CategoriesModel> listOfCats =
        await client.getHomeCategoriesList(Constants.basicAuth);
    categoriesList.addAll(listOfCats);
    return categoriesList;
  }

  getSliders() async {
    List<SlidersModel> listOfSliders =
        await client.getSlidersList(Constants.basicAuth);
    slidersList.addAll(listOfSliders);
    return slidersList;
  }

  getBrands() async {
    List<BrandsModel> listOfBrands =
        await client.getBrandsList(Constants.basicAuth);
    brandsList.addAll(listOfBrands);
    return brandsList;
  }

  getTwoBanners() async {
    TwoBannersModel twoBanners =
        await client.getTwoBanners(Constants.basicAuth);
    twoBannersModel = twoBanners.obs;
    return twoBannersModel;
  }
}
