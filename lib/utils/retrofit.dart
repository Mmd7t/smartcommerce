import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smartcommerce/models/auth_model.dart';
import 'package:smartcommerce/models/brand_products_model.dart';
import 'package:smartcommerce/models/brands_model.dart';
import 'package:smartcommerce/models/categories_model.dart';
import 'package:smartcommerce/models/categories_parent_model.dart';
import 'package:smartcommerce/models/cupon.dart';
import 'package:smartcommerce/models/featured_cats_products_model.dart';
import 'package:smartcommerce/models/flashsale_products_model.dart';
import 'package:smartcommerce/models/mini_product.dart';
import 'package:smartcommerce/models/product_data.dart';
import 'package:smartcommerce/models/product_details_model.dart';
import 'package:smartcommerce/models/recently_added_model.dart';
import 'package:smartcommerce/models/review.dart';
import 'package:smartcommerce/models/reviews_products_model.dart';
import 'package:smartcommerce/models/search.dart';
import 'package:smartcommerce/models/shipping_fee.dart';
import 'package:smartcommerce/models/sliders_model.dart';
import 'package:smartcommerce/models/static_pages_model.dart';
import 'package:smartcommerce/models/two_banners_model.dart';
import 'package:smartcommerce/models/user_orders_model.dart';
import 'package:smartcommerce/models/user_profile_model.dart';

part 'retrofit.g.dart';

@RestApi()
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
  @POST("sociallogin")
  Future<AuthResponseModel> socialLogin(
      @Field("first_name") String firstName,
      @Field("last_name") String lastName,
      @Field("email") String email,
      @Field("gender") String gender);

  /*--------------------------------------------------------------------------*/
  /*------------------------------  Register  --------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("profile")
  Future<UserProfileModel> getUserProfile(
      @Body() Map<String, dynamic> data, @Header("Authorization") String token);

  /*--------------------------------------------------------------------------*/
  /*---------------------------  User Reviews  -------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("user/reviews")
  Future<List<Review>> getProfileReviews(@Field("api_token") String apiToken);

  /*--------------------------------------------------------------------------*/
  /*------------------------  Home Categories List  --------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("features/categories/")
  Future<List<CategoriesModel>> getHomeCategoriesList(
      @Header("Authorization") String token);

  /*--------------------------------------------------------------------------*/
  /*------------------------  Delete From WishList  --------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("wishlist/delete")
  Future<HttpResponse> deleteFromWishList(
      @Field("api_token") String apiToken, @Field("product_id") int productID);

  /*--------------------------------------------------------------------------*/
  /*------------------------  Add To WishList  --------------------------*/
  /*--------------------------------------------------------------------------*/

  @POST("wishlist/store")
  Future<HttpResponse> addToUserWishList(
      @Field("api_token") String apiToken, @Field("product_id") int productID);

  /*--------------------------------------------------------------------------*/
  /*--------------------  Home Categories Parent List  -----------------------*/
  /*--------------------------------------------------------------------------*/

  @GET("categories/parents")
  Future<List<CategoriesParentModel>> getProductMainCategoryData(
      @Header("Authorization") String token);

  /*--------------------------------------------------------------------------*/
  /*-------------------------  mobile token  ---------------------------------*/
  /*--------------------------------------------------------------------------*/

  @POST("mobiletoken")
  Future<HttpResponse> updateToken(
    @Field("token") String token,
    @Field("api_token") String apiToken,
  );

  /*--------------------------------------------------------------------------*/
  /*--------------------  Home Categories child List  -----------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("category/childs/{id}")
  Future<List<CategoriesParentModel>> getCategoryChildren(@Path("id") int id);

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
  Future<FlashSaleProductsModel> getFlashSaleProducts(
      @Header("Authorization") String token);

  /*--------------------------------------------------------------------------*/
  /*----------------------------  Brand Products  ----------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("brand/{id}/products")
  Future<BrandProductsModel> getBrandProducts(@Path("id") int id);

  /*--------------------------------------------------------------------------*/
  /*----------------------------  search Products  ----------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("product/search")
  Future<SearchData> searchProducts(@Field("api_token") String apiToken,
      @Field("search_title") String searchTitle);

  /*--------------------------------------------------------------------------*/
  /*---------------------  Featured Categories Products  ---------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("category/{id}/products")
  Future<FeaturedCatsProductsModel> getFeaturedCatsProducts(@Path("id") int id);

  /*--------------------------------------------------------------------------*/
  /*-----------------------   Products  by  id  ------------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("product/{id}/ ")
  Future<ProductDetailsModel> getProductDetails(@Path("id") int id);

  /*--------------------------------------------------------------------------*/
  /*---------------------  Featured Categories Products  ---------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("mini/product/{id}")
  Future<MiniProduct> getProductCartValid(@Path("id") int id);

  /*--------------------------------------------------------------------------*/
  /*------------------------------  User Orders  -----------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("user/orders")
  Future<List<UserOrdersModel>> getUserOrders(
      @Field("api_token") String apiToken);

  /*--------------------------------------------------------------------------*/
  /*---------------------------  Up Sales Products  --------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("upsell/product/{id}")
  Future<List<ProductData>> getUpSalesProducts(@Path("id") int id);

  /*--------------------------------------------------------------------------*/
  /*-------------------------  Cross Sales Products  -------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("cross/product/{id}")
  Future<List<ProductData>> getCrossSalesProducts(@Path("id") int id);

  /*--------------------------------------------------------------------------*/
  /*------------------------  Related Sales Products  ------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("related/product/{id}")
  Future<List<ProductData>> getRelatedSalesProducts(@Path("id") int id);

  /*--------------------------------------------------------------------------*/
  /*---------------------------  Reviews Products  ---------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("reviews/product/{id}")
  Future<ReviewsProductsModel> getReviewsProducts(@Path("id") int id);

  /*--------------------------------------------------------------------------*/
  /*---------------------------  Reviews Products  ---------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("new/products/{id}")
  Future<RecentlyAddedModel> getRecentlyAddedProducts(
      @Header("Authorization") String token,
      @Path("api_token") String apiToken);

  /*--------------------------------------------------------------------------*/
  /*---------------------------  Reviews Products  ---------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("coupon/{coupon}")
  Future<Coupon> getCouponData(@Path("coupon") String coupon);

  /*--------------------------------------------------------------------------*/
  /*-----------------------------  Static Pages  -----------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("pages")
  Future<List<StaticPagesModel>> getStaticPages();

  /*--------------------------------------------------------------------------*/
  /*-----------------------------  Shipping Cost -----------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("shippingcost")
  Future<ShippingFee> loadingShippingCost();

  /*--------------------------------------------------------------------------*/
  /*----------------------------  Who Are We Page  ---------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("review/store/{id}")
  Future<ReviewResponseModel> addReview(
    @Path("id") int id,
    @Field("api_token") String apiToken,
    @Field("rating") String rating,
    @Field("comment") String comment,
  );

  /*--------------------------------------------------------------------------*/
  /*------------------------------  User Orders  -----------------------------*/
  /*--------------------------------------------------------------------------*/

  @POST("order/store")
  Future<HttpResponse> orderConfirmation(@Body() Map data);
}

//      _dio.interceptors.add(PrettyDioLogger(requestBody: true , requestHeader: true));
