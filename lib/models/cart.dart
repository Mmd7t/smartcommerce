import 'dart:convert';

import 'package:smartcommerce/models/mini_product.dart';
import 'package:smartcommerce/models/product_data.dart';
import 'package:smartcommerce/models/product_details_model.dart';
import 'package:smartcommerce/models/product_submodels.dart';
import 'package:smartcommerce/models/user_profile_model.dart';

import 'flashsale_products_model.dart';

class Cart {
  int id;
  String imageUrl;
  int cartQuantity;
  bool checking = false;
  Price basePrice;
  Price specialPrice;
  Price sellingPrice;
  bool inStock;
  bool manageStock;
  int stockQuantity;
  String name;

  Cart.fromDb(Map json) {
    id = json["id"];
    imageUrl = json["imageUrl"];
    cartQuantity = json["count"];
    basePrice = Price.fromJson(jsonDecode(json["basePrice"]));
    specialPrice = Price.fromJson(jsonDecode(json["specialPrice"]));
    sellingPrice = Price.fromJson(jsonDecode(json["sellingPrice"]));
    inStock = json["sellingPrice"] == 1;
    manageStock = json["sellingPrice"] == 1;
    stockQuantity = json["quantity"];
    name = json["name"];
  }

  Cart.fromProductData(ProductDetailsModel product) {
    id = product.id;
    imageUrl = product.files.first.path;
    cartQuantity = 1;
    basePrice = product.price;
    specialPrice = product.specialPrice;
    sellingPrice = product.sellingPrice;
    inStock = product.inStock;
    manageStock = product.manageStock;
    stockQuantity = product.qty;
    name = product.name;
  }
  Cart.fromMiniProduct(MiniProduct product) {
    cartQuantity = 1;
    basePrice = product.price;
    specialPrice = product.specialPrice;
    sellingPrice = product.sellingPrice;
    inStock = product.inStock;
    manageStock = product.manageStock;
    stockQuantity = product.qty;
  }

  Cart.fromProductSmall(ProductData product) {
    id = product.id;
    imageUrl = product.baseImage;
    cartQuantity = 1;
    specialPrice = product.specialPrice;
    sellingPrice = product.sellingPrice;
    name = product.name;
  }
  Cart.fromProduct(ProductDetailsModel product) {
    id = product.id;
    imageUrl = product.baseImage.path;
    cartQuantity = 1;
    specialPrice = product.specialPrice;
    sellingPrice = product.sellingPrice;
    name = product.name;
  }

  Cart.fromFlashSale(FlashProduct product) {
    id = product.id;
    imageUrl = product.baseImage;
    cartQuantity = 1;
    basePrice = product.price;
    sellingPrice = product.sellingPrice;
    name = product.name;
  }
  Cart.fromWishList(Wishlist product) {
    id = product.id;
    imageUrl = product.baseImage;
    cartQuantity = 1;
    basePrice = product.price;
    sellingPrice = product.sellingPrice;
    name = product.name;
  }

  updatePrices(MiniProduct data) {
    this.specialPrice = data.sellingPrice;
    this.sellingPrice = data.sellingPrice;
    this.inStock = data.inStock;
    this.manageStock = data.manageStock;
    this.stockQuantity = data.qty;
  }

  toDB(Cart cart) {
    Map<String, dynamic> ret = {
      "id": cart.id,
      "count": cart.cartQuantity,
      "quantity": cart.stockQuantity,
      "inStock": cart.inStock == true ? 1 : 0,
      "manageStock": cart.manageStock == true ? 1 : 0,
      "imageUrl": cart.imageUrl,
      "name": cart.name,
      "basePrice":
          jsonEncode(cart.basePrice != null ? cart.basePrice.toJson() : {}),
      "specialPrice":
          jsonEncode(cart.specialPrice != null ? cart.basePrice.toJson() : {}),
      "sellingPrice":
          jsonEncode(cart.sellingPrice != null ? cart.basePrice.toJson() : {}),
    };
    return ret;
  }
}
