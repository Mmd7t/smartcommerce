import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:smartcommerce/models/brands_model.dart';
import 'package:smartcommerce/models/categories_model.dart';
import 'package:smartcommerce/models/sliders_model.dart' hide Options;
import 'package:smartcommerce/models/two_banners_model.dart';
import 'package:smartcommerce/utils/constants.dart';

class HomeController extends GetxController {
  Dio dio = Dio();

  RxList<CategoriesModel> categoriesList = [].obs;
  RxList<SlidersModel> slidersList = [].obs;
  RxList<BrandsModel> brandsList = [].obs;
  Rx<TwoBannersModel> twoBannersModel = TwoBannersModel().obs;

  Future<List<CategoriesModel>> getCategories() async {
    try {
      Response response = await dio.get(
          '${Constants.baseUrl}features/categories',
          options: Options(headers: Constants.headers));

      if (response.statusCode == 200 && response.data != null) {
        categoriesList = (json.decode(response.data))
            .map((model) => CategoriesModel.fromJson(model))
            .toList();

        return categoriesList;
      } else {
        print('error occured');
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<TwoBannersModel> getTwoBanners() async {
    try {
      Response response = await dio.get('${Constants.baseUrl}twobanners',
          options: Options(headers: Constants.headers));

      if (response.statusCode == 200 && response.data != null) {
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
