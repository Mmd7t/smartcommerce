import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/models/address.dart';
import 'package:smartcommerce/models/cart.dart';
import 'package:smartcommerce/models/cupon.dart';
import 'package:smartcommerce/models/flashsale_products_model.dart';
import 'package:smartcommerce/models/product_data.dart';
import 'package:smartcommerce/models/product_details_model.dart';
import 'package:smartcommerce/models/user_profile_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/db/cart_db.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class CartController extends GetxController {
  final client = RestClient(Dio(BaseOptions(headers: Constants.headers)));

  CartDB db;
  RxList<Cart> _cartData = <Cart>[].obs;
  RxBool sendingOrder = RxBool(false);
  RxList<int> cartProcessList = RxList([]);

  updateCartData() {
    _cartData.forEach((element) {
      checkIsAvailability(element.id);
    });
  }

  bool isValidating() {
    bool ret = false;
    for (int index = 0; index < _cartData.length; index++) {
      ret = _cartData[index].checking;
    }
    return ret;
  }

  Future checkIsAvailability(int id) async {
    cartProcessList.add(id);
    int index =
        _cartData.indexOf(_cartData.firstWhere((element) => element.id == id));
    if (_cartData[index].checking == true) {
      return;
    }
    _cartData[index].checking = true;
    final ProductDetailsModel data = await client.getProductDetails(id);
    if (_cartData.where((element) => element.id == id).toList().isEmpty) {
      return;
    }
    _cartData[index] = Cart.fromProductData(data);
    db.updateSelectedCart(_cartData[index]);
    Future.delayed(Duration(seconds: 3));
    _cartData[index].checking = false;
    cartProcessList.remove(id);

    return;
  }

  bool checkIfOutOfStock(int id) {
    bool ret;
    int index =
        _cartData.indexOf(_cartData.firstWhere((element) => element.id == id));
    if (_cartData[index].inStock == false ||
        (_cartData[index].manageStock == true &&
            _cartData[index].stockQuantity < _cartData[index].cartQuantity)) {
      ret = false;
    } else {
      ret = true;
    }
    return ret;
  }

  List<Cart> get cartData {
    return [..._cartData];
  }

  int get itemsCount {
    int count = 0;
    if (_cartData.isNotEmpty) {
      _cartData.forEach((element) {
        count += element.cartQuantity;
      });
    }
    return count;
  }

  double get totalPrice {
    double total = 0.0;
    _cartData.forEach((item) {
      total += (item.cartQuantity * double.parse(item.sellingPrice.amount));
    });
    return total;
  }

  void fromProductSmall(ProductData product) async {
    cartProcessList.add(product.id);

    var _checkItem =
        _cartData.where((element) => element.id == product.id).toList();

    if (_checkItem.isNotEmpty) {
      updateCount(product.id);
      cartProcessList.remove(product.id);

      return;
    } else {
      _cartData.add(
        Cart.fromProductSmall(product),
      );
      ProductDetailsModel data = await client.getProductDetails(product.id);

      updateItem(
        Cart.fromProductData(data),
      );
      db.addCart(_cartData.firstWhere((element) => element.id == product.id));
    }
    cartProcessList.remove(product.id);
  }

  void fromProductFlashSale(FlashProduct product) async {
    cartProcessList.add(product.id);

    var _checkItem =
        _cartData.where((element) => element.id == product.id).toList();

    if (_checkItem.isNotEmpty) {
      updateCount(product.id);
      cartProcessList.remove(product.id);

      return;
    } else {
      _cartData.add(
        Cart.fromFlashSale(product),
      );
      print(_cartData.length);
      ProductDetailsModel data = await client.getProductDetails(product.id);

      updateItem(
        Cart.fromProductData(data),
      );
      db.addCart(_cartData.firstWhere((element) => element.id == product.id));
    }
    cartProcessList.remove(product.id);
  }

  addFromFav(Wishlist product) async {
    cartProcessList.add(product.id);

    if (checkInCart(product.id)) {
      updateCount(product.id);
      cartProcessList.remove(product.id);

      return;
    } else {
      _cartData.add(Cart.fromWishList(product));

      ProductDetailsModel data = await client.getProductDetails(product.id);

      updateItem(
        Cart.fromProductData(data),
      );
      db.addCart(_cartData.firstWhere((element) => element.id == product.id));
    }

    cartProcessList.remove(product.id);
  }

  void updateItem(Cart item) {
    int index = _cartData.indexWhere((element) => element.id == item.id);
    _cartData[index] = item;
    db.updateSelectedCart(_cartData[index]);
  }

  Cart getCart(int id) {
    var _checkItem = _cartData.firstWhere((element) => element.id == id);
    return _checkItem;
  }

  bool checkInCart(int id) {
    List<Cart> _checkItem =
        _cartData.where((element) => element.id == id).toList();
    if (_checkItem.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  bool checkLoadingInCart(int id) {
    bool ret = false;
    if (checkInCart(id)) {
      _cartData.firstWhere((element) => element.id == id).checking = true;
    }

    return ret;
  }

  int checkInCartCount(int id) {
    Cart _checkItem = _cartData.firstWhere((element) => element.id == id);
    if (_checkItem == null) {
      return 0;
    } else {
      return _checkItem.cartQuantity ?? 0;
    }
  }

  void updateCount(int id, {bool plus = true}) {
    int index = _cartData.indexWhere((element) => element.id == id);
    if (_cartData[index].manageStock == false) {
      if (plus == true) {
        _cartData[index].cartQuantity++;
        db.updateSelectedCart(_cartData[index]);
      } else {
        if (_cartData[index].cartQuantity == 1) {
          removeItem(id);
          db.deleteSelectedCart(id);
        } else {
          _cartData[index].cartQuantity--;
          db.updateSelectedCart(_cartData[index]);
        }
      }
    } else {
      if (_cartData[index].cartQuantity < _cartData[index].stockQuantity) {
        if (plus == true) {
          _cartData[index].cartQuantity++;
          db.updateSelectedCart(_cartData[index]);
        } else {
          if (_cartData[index].cartQuantity == 1) {
            removeItem(id);
            db.deleteSelectedCart(id);
          } else {
            _cartData[index].cartQuantity--;
            db.updateSelectedCart(_cartData[index]);
          }
        }
      }
    }
  }

  Future<bool> sendOrder(
    Address address,
    Coupon coupon,
    UserProfileModel userData,
    double shippingCost,
    double total,
  ) async {
    sendingOrder.value = true;
    Map data = {
      "customer_id": userData.id.toString(),
      "customer_email": userData.email,
      "billing[first_name]": userData.firstName,
      "billing[last_name]": userData.lastName,
      "customer_phone": address.phoneNumber,
      "billing[address_1]": address.addressLine,
      "billing[city]": address.city,
      "billing[zip]": address.zipCode,
      "billing[country]": "EG",
      "billing[state]": address.city,
      "payment_method": "cod",
      "shipping_method": "local_pickup",
      "ship_to_different_address": "0",
      "terms_and_conditions": "1",
      "shipping_cost": shippingCost.toString(),
      "sub_total": totalPrice.toString(),
      "total": total.toString(),
    };

    if (coupon.id != 0) {
      data["coupon_id"] = coupon.id.toString();
      data["discount"] = coupon.valueAmount.toString();
    } else {
      data["discount"] = "0";
    }

    for (int index = 0; index < _cartData.length; index++) {
      data["products[${index.toString()}][id]"] =
          _cartData[index].id.toString();
      data["products[${index.toString()}][unit_price]"] =
          _cartData[index].sellingPrice.toString();
      data["products[${index.toString()}][qty]"] =
          _cartData[index].cartQuantity.toString();
      data["products[${index.toString()}][total]"] =
          (_cartData[index].cartQuantity *
                  double.parse(_cartData[index].sellingPrice.amount))
              .toString();
    }

    /// Map response = await sendOrderAPI(data);
    sendingOrder.value = false;

    ///  return response.containsKey("success");
  }

  void removeItem(int cartID) {
    _cartData.removeWhere((cart) => cart.id == cartID);
    db.deleteSelectedCart(cartID);
  }

  void removeSinglePiece(Cart cart) {
    cartProcessList.add(cart.id);

    if (_cartData.firstWhere((element) => element.id == cart.id) == null) {
      cartProcessList.remove(cart.id);

      return;
    }
    int cartItem;
    if (_cartData[_cartData.indexOf(cart)].cartQuantity > 1) {
      cartItem = _cartData.indexOf(cart);
      _cartData[cartItem].cartQuantity--;
    } else {
      removeItem(cart.id);
    }
    db.updateSelectedCart(_cartData[cartItem]);
    cartProcessList.remove(cart.id);
  }

  void clearAll() {
    _cartData.clear();
    db.deleteCarts();
  }

  initDB() async {
    db = CartDB();
    await db.init();
    _cartData.value = await db.getCarts();
    print(_cartData.length);
  }
}
