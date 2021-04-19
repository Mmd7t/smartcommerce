import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/models/brand_products_model.dart';
import 'package:smartcommerce/models/featured_cats_products_model.dart';
import 'package:smartcommerce/models/product_details_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';
import 'package:smartcommerce/utils/shared_prefs.dart';

class ProductsController extends GetxController {
  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));
/*------------------------------  Brand Products  -------------------------------*/
  RxInt selectedBrandProduct = RxInt(0);
  Rx<BrandProductsModel> brandProducts = BrandProductsModel().obs;
  //// loader /////
  RxBool loadingBrandProducts = RxBool(false);
/*---------------------------  Featured Cats Products  --------------------------*/
  RxInt selectedFeaturedCatsProducts = RxInt(0);
  Rx<FeaturedCatsProductsModel> featuredCatsProducts =
      FeaturedCatsProductsModel().obs;
  //// loader /////
  RxBool loadingfeaturedCatsProducts = RxBool(false);
/*------------------------------  Product Details  ------------------------------*/
  RxInt selectedProductDetails = RxInt(0);
  Rx<ProductDetailsModel> productDetails = ProductDetailsModel().obs;
  //// loader /////
  RxBool loadingProductDetails = RxBool(false);

  setSelectedProductDetails(int value) {
    selectedProductDetails = value.obs;
  }

  RxString apiToken;
  Future<void> getToken() async {
    String data = await SharedPrefsHelper.getApiTokenFromPrefs();
    if (data != null) {
      apiToken = data.obs;
    }
  }

  getBrandProducts() async {
    print(selectedBrandProduct.value);
    loadingBrandProducts.value = true;
    BrandProductsModel data =
        await client.getBrandProducts(selectedBrandProduct.value);
    if (data != null) {
      print('Brand Products is hereeeeeeeeeeeeeeeeeeeee');
      brandProducts = data.obs;
    }
    loadingBrandProducts.value = false;
  }

  getFeaturedCatsProducts() async {
    print(selectedFeaturedCatsProducts.value);
    loadingfeaturedCatsProducts.value = true;
    FeaturedCatsProductsModel data = await client
        .getFeaturedCatsProducts(selectedFeaturedCatsProducts.value);
    if (data != null) {
      print('Featured Cats Products is hereeeeeeeeeeeeeeeeeeeee');
      featuredCatsProducts = data.obs;
    }
    loadingfeaturedCatsProducts.value = false;
  }

  getProductDetails() async {
    await getToken();
    if (apiToken.value != null) {
      print(selectedProductDetails.value);
      loadingProductDetails.value = true;
      ProductDetailsModel data =
          await client.getProductDetails(selectedProductDetails.value);
      if (data != null) {
        print('Product Details is hereeeeeeeeeeeeeeeeeeeee');
        productDetails = data.obs;
      }
      loadingfeaturedCatsProducts.value = false;
    }
  }
}
