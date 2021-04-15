import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smartcommerce/models/categories_model.dart';
import 'package:smartcommerce/utils/constants.dart';
part 'retrofit.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /*-----------------------------------------------------------------------------------*/
  /*-------------------------------------  Login  -------------------------------------*/
  /*-----------------------------------------------------------------------------------*/
  @POST("login/")
  Future<HttpResponse> postLogin(@Body() Map<String, dynamic> data);

  /*-----------------------------------------------------------------------------------*/
  /*-----------------------------------  Register  ------------------------------------*/
  /*-----------------------------------------------------------------------------------*/
  @POST("register/")
  Future<HttpResponse> postRegister(@Body() Map<String, dynamic> data);

  /*-----------------------------------------------------------------------------------*/
  /*-----------------------------  Home Categories List  ------------------------------*/
  /*-----------------------------------------------------------------------------------*/
  @GET("features/categories/")
  Future<RxList<CategoriesModel>> getHomeCategoriesList(
      @Header("Authorization") String token);
}
