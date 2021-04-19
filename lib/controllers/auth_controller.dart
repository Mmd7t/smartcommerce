import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smartcommerce/models/auth_model.dart';
import 'package:smartcommerce/models/review.dart';
import 'package:smartcommerce/models/user_profile_model.dart';
import 'package:smartcommerce/pages/main_page.dart';
import 'package:smartcommerce/pages/registration/registration.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';
import 'package:smartcommerce/utils/shared_prefs.dart';

class AuthController extends GetxController {
  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));
  Rx<UserProfileModel> userProfileModel = UserProfileModel().obs;
  RxList<Review> reviews = <Review>[].obs;
  RxString apiToken;

////// loaders //////////////////////
  RxBool loadingReviews = RxBool(false);
  RxBool userDataLoading = RxBool(false);
  RxBool wishListLoading = RxBool(false);

  void saveToken(String token) {
    apiToken = token.obs;
    SharedPrefsHelper.saveApiKeyToPrefs(token);
  }

  Future<void> getToken() async {
    String data = await SharedPrefsHelper.getApiTokenFromPrefs();
    if (data != null) {
      apiToken = data.obs;
    }
  }

  void navigate() {
    if (apiToken == null) {
      Get.toNamed(Registration.routeName);
    } else {
      Get.toNamed(MainPage.routeName);
    }
  }

  Future<void> register(registerModel) async {
    try {
      AuthResponseModel response = await client.postRegister(
          registerModel.toJson(), Constants.basicAuth);
      if (response != null) {
        saveToken(response.apiToken);
        Get.toNamed(MainPage.routeName);
        print(response.apiToken);
        getUserProfile();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> login(loginModel) async {
    try {
      AuthResponseModel response =
          await client.postLogin(loginModel.toJson(), Constants.basicAuth);
      if (response != null) {
        saveToken(response.apiToken);
        Get.toNamed(MainPage.routeName);
        getUserProfile();
        print(response.apiToken);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> getUserProfile() async {
    await getToken();
    if (apiToken != null) {
      userDataLoading.value = true;
      wishListLoading.value = true;
      UserProfileModel response = await client
          .getUserProfile({'api_token': apiToken.value}, Constants.basicAuth);
      if (response != null) {
        print(response.email);
        userProfileModel = response.obs;
      }
      userDataLoading.value = false;
      wishListLoading.value = false;
    }
  }

  void getUserReviews() async {
    await getToken();
    if (apiToken != null && loadingReviews.value == false && reviews.isEmpty) {
      loadingReviews.value = true;
      List<Review> data = await client.getProfileReviews(apiToken.value);
      if (data != null) {
        reviews = data.obs;
      }
      loadingReviews.value = false;
    }
  }

  Future<void> addToFav(int id) async {
    await getToken();
    if (apiToken != null && loadingReviews.value == false && reviews.isEmpty) {
      wishListLoading.value = true;
      HttpResponse data = await client.addToUserWishList(apiToken.value, id);
      if (data != null) {
        getUserReviews();
      }
      wishListLoading.value = false;
    }
  }

  Future<void> removeFromFav(int id) async {
    await getToken();
    if (apiToken != null && loadingReviews.value == false && reviews.isEmpty) {
      wishListLoading.value = true;
      HttpResponse data = await client.deleteFromWishList(apiToken.value, id);
      if (data != null) {
        getUserReviews();
      }
      wishListLoading.value = false;
    }
  }

  void lookUpFav(int id) async {
    if (userProfileModel.value.wishlist
        .where((element) => element.id == id)
        .isNotEmpty) {
      await removeFromFav(id);
    } else {
      await addToFav(id);
    }
  }
}
