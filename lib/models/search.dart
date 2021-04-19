import 'package:smartcommerce/models/product_data.dart';

class SearchData {
  List<ProductData> products;

  SearchData.fromJson(Map json) {
    products = [];

    if (json["products"] != null) {
      if (json["products"]["data"] != null) {
        json["products"]["data"].forEach((element) {
          products.add(ProductData.fromJson(element));
        });
      }
    }
  }

  SearchData() {
    products = [];
  }
}
