import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smartcommerce/models/auth_model.dart';
import 'package:smartcommerce/models/brands_model.dart';
import 'package:smartcommerce/models/categories_model.dart';
import 'package:smartcommerce/models/categories_parent_model.dart';
import 'package:smartcommerce/models/flashsale_products_model.dart';
import 'package:smartcommerce/models/sliders_model.dart';
import 'package:smartcommerce/models/two_banners_model.dart';
import 'package:smartcommerce/models/user_profile_model.dart';
import 'package:smartcommerce/utils/constants.dart';
part 'retrofit.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  Login  ---------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("login")
  Future<AuthResponseModel> postLogin(
      @Body() Map<String, dynamic> data, @Header("Authorization") String token);

  /*--------------------------------------------------------------------------*/
  /*------------------------------  Register  --------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("register")
  Future<AuthResponseModel> postRegister(
      @Body() Map<String, dynamic> data, @Header("Authorization") String token);

  /*--------------------------------------------------------------------------*/
  /*------------------------------  Register  --------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("profile")
  Future<UserProfileModel> getUserProfile(
      @Body() Map<String, dynamic> data, @Header("Authorization") String token);

  /*--------------------------------------------------------------------------*/
  /*------------------------  Home Categories List  --------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("features/categories/")
  Future<List<CategoriesModel>> getHomeCategoriesList(
      @Header("Authorization") String token);

  /*--------------------------------------------------------------------------*/
  /*--------------------  Home Categories Parent List  -----------------------*/
  /*--------------------------------------------------------------------------*/

  @GET("categories/parents")
  Future<List<CategoriesParentModel>> getProductMainCategoryData(
      @Header("Authorization") String token);

  /*--------------------------------------------------------------------------*/
  /*--------------------------  Home Sliders List  ---------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("sliders/")
  Future<List<SlidersModel>> getSlidersList(
      @Header("Authorization") String token);

  /*--------------------------------------------------------------------------*/
  /*--------------------------  Home Brands List  ----------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("brands/")
  Future<List<BrandsModel>> getBrandsList(
      @Header("Authorization") String token);

  /*--------------------------------------------------------------------------*/
  /*--------------------------  Home Two Banners  ----------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("twobanners/")
  Future<TwoBannersModel> getTwoBanners(@Header("Authorization") String token);

  /*--------------------------------------------------------------------------*/
  /*-----------------------  Home Flashsale Products  ------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("flashsale/products/")
  Future<FlashsaleProductsModel> getFlashsaleProducts(
      @Header("Authorization") String token);
}
