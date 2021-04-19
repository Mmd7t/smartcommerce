import 'categories_parent_model.dart';

class SubCategory {
  bool fetching = false;
  List<CategoriesParentModel> data;

  SubCategory({this.fetching, this.data});
  SubCategory.empty() {
    this.fetching = true;
    this.data = [];
  }
}
