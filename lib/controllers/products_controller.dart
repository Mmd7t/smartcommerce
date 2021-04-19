import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/models/brand_products_model.dart';
import 'package:smartcommerce/models/featured_cats_products_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class ProductsController extends GetxController {
  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));

  RxInt selectedBrandProduct = RxInt(0);
  Rx<BrandProductsModel> brandProducts = BrandProductsModel().obs;

  RxInt selectedFeaturedCatsProducts = RxInt(0);
  Rx<FeaturedCatsProductsModel> featuredCatsProducts =
      FeaturedCatsProductsModel().obs;

  getBrandProducts() async {
    try {
      BrandProductsModel data =
          await client.getBrandProducts(selectedBrandProduct.value);
      if (data != null) {
        print('Brand Products is hereeeeeeeeeeeeeeeeeeeee');
        brandProducts = data.obs;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }

  getFeaturedCatsProducts() async {
    try {
      FeaturedCatsProductsModel data = await client
          .getFeaturedCatsProducts(selectedFeaturedCatsProducts.value);
      if (data != null) {
        print('Brand Products is hereeeeeeeeeeeeeeeeeeeee');
        featuredCatsProducts = data.obs;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }

  // void getSelectedSubCategories() async {
  //   if (subCategories[selectedSubCategories.value] != null &&
  //       subCategories[selectedSubCategories.value].data.isNotEmpty &&
  //       subCategories[selectedSubCategories.value].fetching != true) {
  //   } else {
  //     subCategories[selectedSubCategories.value] = SubCategory.empty();
  //     List data = await client.getCategoryChildren(selectedSubCategories.value);
  //     if (data != null) {
  //       subCategories.update(
  //           selectedSubCategories.value, (value) => value..data = data);
  //       subCategories[selectedSubCategories.value].data = data;
  //     }
  //     subCategories[selectedSubCategories.value].fetching = false;
  //   }
  // }
}
