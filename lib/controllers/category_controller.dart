import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/models/categories_parent_model.dart';
import 'package:smartcommerce/models/sub_category.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class CategoryController extends GetxController {
  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));

  RxMap<int, SubCategory> subCategories = <int, SubCategory>{}.obs;

  RxList<CategoriesParentModel> categoriesParentList =
      <CategoriesParentModel>[].obs;

  RxBool fetchingMainCategories = RxBool(false);

  RxInt selectedSubCategories = RxInt(0);

  void getSelectedSubCategories() async {
    if (subCategories[selectedSubCategories.value] != null &&
        subCategories[selectedSubCategories.value].data.isNotEmpty &&
        subCategories[selectedSubCategories.value].fetching != true) {
    } else {
      subCategories[selectedSubCategories.value] = SubCategory.empty();
      List data = await client.getCategoryChildren(selectedSubCategories.value);
      if (data != null) {
        subCategories.update(
            selectedSubCategories.value, (value) => value..data = data);
        subCategories[selectedSubCategories.value].data = data;
      }
      subCategories[selectedSubCategories.value].fetching = false;
    }
  }

  void getCategoriesParents() async {
    fetchingMainCategories.value = true;
    List<CategoriesParentModel> listOfCatsParents =
        await client.getProductMainCategoryData(Constants.basicAuth);
    categoriesParentList = listOfCatsParents.obs;
    fetchingMainCategories.value = false;
  }

  List<CategoriesParentModel> subCategoriesList() {
    List<CategoriesParentModel> ret = [];
    if (subCategories[selectedSubCategories.value] != null) {
      if (subCategories[selectedSubCategories.value].fetching != true) {
        ret = subCategories[selectedSubCategories.value].data;
      }
    }
    return ret;
  }

  List<CategoriesParentModel> subCategoriesListCategoryIndex(int index) {
    List<CategoriesParentModel> ret = [];
    if (subCategories[index] != null) {
      if (subCategories[index].fetching != true) {
        ret = subCategories[index].data;
      }
    }
    return ret;
  }

  bool subCategoriesListLoader() {
    bool ret = false;
    if (subCategories[selectedSubCategories.value] != null) {
      ret = subCategories[selectedSubCategories.value].fetching;
    }
    return ret;
  }
}
