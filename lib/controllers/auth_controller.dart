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
import 'package:smartcommerce/utils/helper/auth_alert.dart';
import 'package:smartcommerce/utils/pref/notification_token.dart';
import 'package:smartcommerce/utils/retrofit.dart';
import 'package:smartcommerce/utils/shared_prefs.dart';
import 'package:smartcommerce/widgets/custom_dialog.dart';

class AuthController extends GetxController {
  RestClient client = RestClient(
      Dio(BaseOptions(headers: Constants.headers, baseUrl: Constants.baseUrl)));
  Rx<UserProfileModel> userProfileModel = UserProfileModel().obs;
  RxList<Review> reviews = <Review>[].obs;
  RxString apiToken;

////// loaders //////////////////////
  RxBool loadingReviews = RxBool(false);
  RxBool userDataLoading = RxBool(false);
  RxBool wishListLoading = RxBool(false);
  RxList<int> wishListProcessList = RxList([]);

  updateClient() {
    logOut(false);
    client = RestClient(Dio(
        BaseOptions(headers: Constants.headers, baseUrl: Constants.baseUrl)));
  }

  void saveToken(String token) {
    apiToken = token.obs;
    SharedPrefsHelper.saveApiKeyToPrefs(token);
  }

  Future<void> getToken() async {
    String data = await SharedPrefsHelper.getApiTokenFromPrefs();
    if (data != null) {
      apiToken = data.obs;
    }
    print(data);
  }

  void navigate() {
    // if (apiToken == null) {
    //   Get.toNamed(Registration.routeName);
    // } else {
    Get.toNamed(MainPage.routeName);
    // }
  }

/*--------------------------------------------------------------------------------------*/
/*--------------------------------  Register Function  ---------------------------------*/
/*--------------------------------------------------------------------------------------*/

  Future<void> register(registerModel) async {
    AuthResponseModel response =
        await client.postRegister(registerModel.toJson(), Constants.basicAuth);
    if (response != null) {
      saveToken(response.apiToken);
      Get.toNamed(MainPage.routeName);
      print(response.apiToken);
      getUserProfile();
    }
  }
/*-------------------------------------------------------------------------------------*/
/*----------------------------  FCM Function  -----------------------------*/
/*-------------------------------------------------------------------------------------*/

  updateToken(String token) async {
    if (apiToken != null) {
      String oldToken = await FCMStorage.getFCM();
      if (oldToken != token) {
        HttpResponse response = await client.updateToken(token, apiToken.value);
        if (response != null && response.data["message"] == "saved_succeffly") {
          FCMStorage.storeFCM(token);
        }
      }
    }
  }

/*-------------------------------------------------------------------------------------*/
/*----------------------------  Register Social Function  -----------------------------*/
/*-------------------------------------------------------------------------------------*/

  loginSocialData(
      String firstName, String lastName, String email, String gender) async {
    bool ret = false;
    AuthResponseModel newUser =
        await client.socialLogin(firstName, lastName, email, gender);
    if (newUser != null && newUser.apiToken != null && newUser.apiToken != "") {
      saveToken(newUser.apiToken);
      Get.toNamed(MainPage.routeName);
      print(newUser.apiToken);
      getUserProfile();
      ret = true;
    }
    return ret;
  }

/*--------------------------------------------------------------------------------------*/
/*----------------------------------  Logout Function  ---------------------------------*/
/*--------------------------------------------------------------------------------------*/

  logOut(bool reload) {
    updateToken("dd");
    SharedPrefsHelper.removeToken();
    if (reload) {
      Get.offAllNamed(Registration.routeName);
    }
    FCMStorage.removeFCM();
  }

/*--------------------------------------------------------------------------------------*/
/*----------------------------------  Login Function  ----------------------------------*/
/*--------------------------------------------------------------------------------------*/

  Future<void> login(loginModel) async {
    try {
      AuthResponseModel response =
          await client.postLogin(loginModel.toJson(), Constants.basicAuth);
      if (response != null && response.message == 'success') {
        saveToken(response.apiToken);
        Get.toNamed(MainPage.routeName);
        getUserProfile();
        print(response.apiToken);
      } else if (response.message == 'wrong_email') {
        errorDialog(content: 'wrong email\ntry again please');
      } else if (response.message == 'wrong_password') {
        errorDialog(content: 'wrong password\ntry again please');
      } else {
        errorDialog(content: 'error ocured\ntry again please');
      }
    } catch (e) {
      throw e;
    }
  }

/*--------------------------------------------------------------------------------------*/
/*------------------------------  User Profile Function  -------------------------------*/
/*--------------------------------------------------------------------------------------*/

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

  ////// fav ///////////////////////

  Future<void> addToFav(int id) async {
    wishListProcessList.add(id);
    if (apiToken != null && loadingReviews.value == false && reviews.isEmpty) {
      wishListLoading.value = true;
      HttpResponse data = await client.addToUserWishList(apiToken.value, id);
      if (data != null) {
        await getUserProfile();
      }
      wishListLoading.value = false;
    }
    wishListProcessList.remove(id);
  }

  Future<void> removeFromFav(int id) async {
    wishListProcessList.add(id);
    if (apiToken != null && loadingReviews.value == false && reviews.isEmpty) {
      wishListLoading.value = true;
      HttpResponse data = await client.deleteFromWishList(apiToken.value, id);
      if (data != null) {
        await getUserProfile();
      }
      wishListLoading.value = false;
    }
    wishListProcessList.remove(id);
  }

  void lookUpFav(int id) async {
    if (apiToken != null) {
      if (wishListLoading.value != true) {
        if (userProfileModel.value.wishList
            .where((element) => element.id == id)
            .isNotEmpty) {
          await removeFromFav(id);
        } else {
          await addToFav(id);
        }
      }
    } else {
      showAuthAlertDialog();
    }
  }

  bool inFav(int id) {
    bool ret = false;
    if (apiToken != null) {
      if (userProfileModel.value.wishList != null) {
        if (userProfileModel.value.wishList
            .where((element) => element.id == id)
            .isNotEmpty) {
          ret = true;
        }
      }
    }
    return ret;
  }
}
