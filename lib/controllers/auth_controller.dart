import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/models/auth_model.dart';
import 'package:smartcommerce/models/user_profile_model.dart';
import 'package:smartcommerce/pages/main_page.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';
import 'package:smartcommerce/utils/shared_prefs.dart';

class AuthController extends GetxController {
  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));
  Rx<UserProfileModel> userProfileModel = UserProfileModel().obs;
  RxString apiToken;

  saveToken(String token) {
    apiToken = token.obs;
  }

  register(registerModel) async {
    try {
      AuthResponseModel response = await client.postRegister(
          registerModel.toJson(), Constants.basicAuth);
      if (response != null) {
        await SharedPrefsHelper.saveApiKeyToPrefs(response.apiToken.toString());
        saveToken(response.apiToken);
        Get.toNamed(MainPage.routeName);
        print(response.apiToken);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }

  login(loginModel) async {
    try {
      AuthResponseModel response =
          await client.postLogin(loginModel.toJson(), Constants.basicAuth);
      if (response != null) {
        await SharedPrefsHelper.saveApiKeyToPrefs(response.apiToken.toString());
        saveToken(response.apiToken);
        Get.toNamed(MainPage.routeName);
        print(response.apiToken);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }

  getUserProfile() async {
    try {
      await saveToken(SharedPrefsHelper.getApiTokenFromPrefs());
      UserProfileModel response = await client
          .getUserProfile({'api_token': apiToken.value}, Constants.basicAuth);
      if (response != null) {
        print(response.email);
        userProfileModel = response.obs;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }
}
