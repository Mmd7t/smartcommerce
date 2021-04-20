import 'package:smartcommerce/models/product_data.dart';

class CategoryProducts {
  bool fetching = false;
  List<ProductData> data;

  CategoryProducts({this.fetching, this.data});
  CategoryProducts.empty() {
    this.fetching = true;
    this.data = [];
  }
}
