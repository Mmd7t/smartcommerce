import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smartcommerce/models/brands_model.dart';
import 'package:smartcommerce/models/categories_model.dart';
import 'package:smartcommerce/models/flashsale_products_model.dart';
import 'package:smartcommerce/models/sliders_model.dart';
import 'package:smartcommerce/models/two_banners_model.dart';
import 'package:smartcommerce/utils/constants.dart';
part 'retrofit.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  Login  ---------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("login/")
  Future<HttpResponse> postLogin(@Body() Map<String, dynamic> data);

  /*--------------------------------------------------------------------------*/
  /*------------------------------  Register  --------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("register/")
  Future<HttpResponse> postRegister(@Body() Map<String, dynamic> data);

  /*--------------------------------------------------------------------------*/
  /*------------------------  Home Categories List  --------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("features/categories/")
  Future<List<CategoriesModel>> getHomeCategoriesList(
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
