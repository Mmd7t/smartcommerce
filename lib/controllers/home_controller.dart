import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smartcommerce/models/brands_model.dart';
import 'package:smartcommerce/models/categories_model.dart';
import 'package:smartcommerce/models/sliders_model.dart' hide Options;
import 'package:smartcommerce/models/two_banners_model.dart';
import 'package:smartcommerce/utils/constants.dart';
<<<<<<< HEAD
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:smartcommerce/utils/retrofit.dart';
=======
>>>>>>> 0fd57e89a03a3b8535e123e402e89205d7729425

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
    // getCategories();
    getCats();
    // getBrands();
    // getSliders();
    // getTwoBanners();
  }

<<<<<<< HEAD
  getCats() async {
    categoriesList = await client.getHomeCategoriesList(Constants.basicAuth);
    return categoriesList;
  }

  // Future<RxList<CategoriesModel>> getCategories() async {
  //   dio.interceptors.add(PrettyDioLogger(
  //     requestHeader: true,
  //     requestBody: true,
  //     responseBody: true,
  //     responseHeader: false,
  //     compact: false,
  //   ));

  //   Response response = await dio.get('${Constants.baseUrl}features/categories',
  //       options: Options(headers: Constants.headers));

  //   if (response.statusCode == 200 && response.data != null) {
  //     List data = response.data;
  //     List<CategoriesModel> newList = [];
  //     data.forEach((element) {
  //       newList.add(CategoriesModel.fromJson(element));
  //     });

  //     categoriesList.addAll(newList);
  //     return categoriesList;
  //   } else {
  //     print('errorrrrrrrrrrrrrrrrrrrrrrrr occured');
  //     throw Exception();
  //   }
  // }
=======
  Future<RxList<CategoriesModel>> getCategories() async {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    Response response = await dio.get('${Constants.baseUrl}features/categories',
        options: Options(headers: Constants.headers));

    if (response.statusCode == 200 && response.data != null) {
      List data = response.data;
      List<CategoriesModel> newList = [];
      data.forEach((element) {
        newList.add(CategoriesModel.fromJson(element));
      });

      categoriesList.addAll(newList);
      return categoriesList;
    } else {
      print('errorrrrrrrrrrrrrrrrrrrrrrrr occured');
      throw Exception();
    }
  }
>>>>>>> 0fd57e89a03a3b8535e123e402e89205d7729425

  Future<TwoBannersModel> getTwoBanners() async {
    try {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ));
      Response response = await dio.get('${Constants.baseUrl}twobanners',
          options: Options(headers: Constants.headers));

      if (response.statusCode == 200 && response.data != null) {
        print(response.statusCode);
        return twoBannersModelFromJson(response.data.toString());
      } else {
        print('error occured');
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<RxList<BrandsModel>> getBrands() async {
    try {
      Response response = await dio.get('${Constants.baseUrl}brands',
          options: Options(headers: Constants.headers));

      if (response.statusCode == 200 && response.data != null) {
        return brandsModelFromJson(response.data);
      } else {
        print('error occured');
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<RxList<SlidersModel>> getSliders() async {
    try {
      Response response = await dio.get('${Constants.baseUrl}sliders',
          options: Options(headers: Constants.headers));

      if (response.statusCode == 200 && response.data != null) {
        return slidersModelFromJson(response.data);
      } else {
        print('error occured');
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }
}
