import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/models/brand_products_model.dart';
import 'package:smartcommerce/models/category_products.dart';
import 'package:smartcommerce/models/featured_cats_products_model.dart';
import 'package:smartcommerce/models/product_data.dart';
import 'package:smartcommerce/models/product_details_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class ProductsController extends GetxController {
  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));

/*------------------------------  Brand Products  -------------------------------*/
  RxInt selectedBrandProduct = RxInt(0);
  Rx<BrandProductsModel> brandProducts = BrandProductsModel().obs;
  RxBool loadingBrandProducts = RxBool(false);

/*---------------------------  Featured Cats Products  --------------------------*/
  RxInt selectedFeaturedCatsProducts = RxInt(0);
  Rx<FeaturedCatsProductsModel> featuredCatsProducts =
      FeaturedCatsProductsModel().obs;
  RxBool loadingFeaturedCatsProducts = RxBool(false);

/*------------------------------  Brand Products  -------------------------------*/
  RxInt selectedCategoryProduct = RxInt(0);
  RxInt selectedCategory = RxInt(0);
  RxMap<int, CategoryProducts> categoryProducts = <int, CategoryProducts>{}.obs;

/*------------------------------  Product Details  ------------------------------*/
  RxInt selectedProductDetails = RxInt(0);
  Rx<ProductDetailsModel> productDetails = ProductDetailsModel().obs;
  RxBool loadingProductDetails = RxBool(false);

  setSelectedProductDetails(int value) {
    selectedProductDetails = value.obs;
  }

  getBrandProducts() async {
    print(selectedBrandProduct.value);
    loadingBrandProducts.value = true;
    BrandProductsModel data =
        await client.getBrandProducts(selectedBrandProduct.value);
    if (data != null) {
      brandProducts = data.obs;
    }
    loadingBrandProducts.value = false;
  }

  getFeaturedCatsProducts() async {
    print(selectedFeaturedCatsProducts.value);
    loadingFeaturedCatsProducts.value = true;
    FeaturedCatsProductsModel data = await client
        .getFeaturedCatsProducts(selectedFeaturedCatsProducts.value);
    if (data != null) {
      featuredCatsProducts = data.obs;
    }
    loadingFeaturedCatsProducts.value = false;
  }

  void getSelectedCategoryProducts() async {
    if (categoryProducts[selectedCategoryProduct.value] != null &&
        categoryProducts[selectedCategoryProduct.value].data.isNotEmpty &&
        categoryProducts[selectedCategoryProduct.value].fetching != true) {
    } else {
      categoryProducts[selectedCategoryProduct.value] =
          CategoryProducts.empty();
      FeaturedCatsProductsModel data =
          await client.getFeaturedCatsProducts(selectedCategoryProduct.value);
      if (data != null) {
        categoryProducts.update(selectedCategoryProduct.value,
            (value) => value..data = data.products.data);
        categoryProducts[selectedCategoryProduct.value].data =
            data.products.data;
      }
      categoryProducts[selectedCategoryProduct.value].fetching = false;
    }
  }

  bool categoriesListLoader() {
    bool ret = false;
    if (categoryProducts[selectedCategoryProduct.value] != null) {
      ret = categoryProducts[selectedCategoryProduct.value].fetching;
    }
    return ret;
  }

  List<ProductData> categoryProductList() {
    List<ProductData> ret = [];
    if (categoryProducts[selectedCategoryProduct.value] != null) {
      if (categoryProducts[selectedCategoryProduct.value].fetching != true) {
        ret = categoryProducts[selectedCategoryProduct.value].data;
      }
    }
    return ret;
  }

  getProductDetails(int id) async {
    selectedProductDetails.value = id;
    print(selectedProductDetails.value);
    loadingProductDetails.value = true;
    ProductDetailsModel data = await client.getProductDetails(
        id, (Get.put(AuthController()).apiToken ?? " ".obs).value);
    if (data != null) {
      print('Product Details is hereeeeeeeeeeeeeeeeeeeee');
      productDetails = data.obs;
    }

    loadingFeaturedCatsProducts.value = false;
  }
}
