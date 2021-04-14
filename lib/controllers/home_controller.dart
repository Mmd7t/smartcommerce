import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:smartcommerce/models/brands_model.dart';
import 'package:smartcommerce/models/categories_model.dart';
import 'package:smartcommerce/models/sliders_model.dart' hide Options;
import 'package:smartcommerce/models/two_banners_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HomeController extends GetxController {
  Dio dio = Dio();

  RxList<CategoriesModel> categoriesList = <CategoriesModel>[].obs;
  RxList<SlidersModel> slidersList = <SlidersModel>[].obs;
  RxList<BrandsModel> brandsList = <BrandsModel>[].obs;
  Rx<TwoBannersModel> twoBannersModel = TwoBannersModel().obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
    // getBrands();
    // getSliders();
    getTwoBanners();
  }

  Future<List<CategoriesModel>> getCategories() async {
    try {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ));

      Response response = await dio.get(
          '${Constants.baseUrl}features/categories',
          options: Options(headers: Constants.headers));

      if (response.statusCode == 200 && response.data != null) {
        categoriesList = (json.decode(response.data.toString()))
            .map((model) => CategoriesModel.fromJson(model))
            .toList();

        return categoriesList;
      } else {
        print('errorrrrrrrrrrrrrrrrrrrrrrrr occured');
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }

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

  Future<List<BrandsModel>> getBrands() async {
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

  Future<List<SlidersModel>> getSliders() async {
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
