import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/models/brand_products_model.dart';
import 'package:smartcommerce/models/category_products.dart';
import 'package:smartcommerce/models/featured_cats_products_model.dart';
import 'package:smartcommerce/models/product_data.dart';
import 'package:smartcommerce/models/product_details_model.dart';
import 'package:smartcommerce/models/reviews_products_model.dart';
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
//
//
//
//
//
//
//
/*------------------------------  Product Details  ------------------------------*/
  RxInt selectedProductDetails = RxInt(0);
  Rx<ProductDetailsModel> productDetails = ProductDetailsModel().obs;
  RxBool loadingProductDetails = RxBool(false);

/*------------------------------  Up Sales Products  ------------------------------*/
  RxInt selectedUpSaleProduct = RxInt(0);
  RxList<ProductData> upSaleProduct = <ProductData>[].obs;
  RxBool loadingUpSaleProduct = RxBool(false);

/*------------------------------  Cross Sales Products  ------------------------------*/
  RxInt selectedCrossSaleProduct = RxInt(0);
  RxList<ProductData> crossSaleProduct = <ProductData>[].obs;
  RxBool loadingCrossSaleProduct = RxBool(false);

/*------------------------------  Related Sales Products  ------------------------------*/
  RxInt selectedRelatedSaleProduct = RxInt(0);
  RxList<ProductData> relatedSaleProduct = <ProductData>[].obs;
  RxBool loadingRelatedSaleProduct = RxBool(false);

/*------------------------------  Related Sales Products  ------------------------------*/
  RxInt selectedReviewsProduct = RxInt(0);
  Rx<ReviewsProductsModel> reviewsProduct = ReviewsProductsModel().obs;
  RxBool loadingReviewsProduct = RxBool(false);
//
//
//
//
//
//
//
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
    loadingProductDetails.value = true;
    selectedProductDetails.value = id;
    print(selectedProductDetails.value);
    loadingProductDetails.value = true;
    ProductDetailsModel data = await client.getProductDetails(id);
    if (data != null) {
      print('Product Details is hereeeeeeeeeeeeeeeeeeeee');
      productDetails = data.obs;
    }
    loadingProductDetails.value = false;
  }

  getUpSaleProducts(int id) async {
    loadingUpSaleProduct.value = true;
    selectedUpSaleProduct.value = id;
    print(selectedUpSaleProduct.value);
    List<ProductData> data = await client.getUpSalesProducts(id);
    if (data != null) {
      print('Up sale Products is hereeeeeeeeeeeeeeeeeeeee');
      upSaleProduct.value = data;
    }
    loadingUpSaleProduct.value = false;
  }

  getCrossSaleProducts(int id) async {
    loadingCrossSaleProduct.value = true;
    selectedCrossSaleProduct.value = id;
    print(
        'selectedCrossSaleProduct' + selectedCrossSaleProduct.value.toString());
    print(id);
    List<ProductData> data = await client.getCrossSalesProducts(id);
    if (data != null) {
      print('Cross sale Products is hereeeeeeeeeeeeeeeeeeeee');
      crossSaleProduct.value = data;
    }
    loadingCrossSaleProduct.value = false;
  }

  getRelatedSaleProducts(int id) async {
    loadingRelatedSaleProduct.value = true;
    selectedRelatedSaleProduct.value = id;
    print('selectedRelatedSaleProduct' +
        selectedRelatedSaleProduct.value.toString());
    print('iddddddddddddd $id');
    List<ProductData> data = await client.getRelatedSalesProducts(id);
    if (data != null) {
      print('Related sale Products is hereeeeeeeeeeeeeeeeeeeee');
      relatedSaleProduct.value = data;
    }
    loadingRelatedSaleProduct.value = false;
  }

  getReviewsProducts(int id) async {
    loadingReviewsProduct.value = true;
    selectedReviewsProduct.value = id;
    print('selectedReviewsProduct' + selectedReviewsProduct.value.toString());
    print('iddddddddddddd $id');
    ReviewsProductsModel data = await client.getReviewsProducts(id);
    if (data != null) {
      print('Reviews Products is hereeeeeeeeeeeeeeeeeeeee');
      reviewsProduct.value = data;
    }
    loadingReviewsProduct.value = false;
  }
}
