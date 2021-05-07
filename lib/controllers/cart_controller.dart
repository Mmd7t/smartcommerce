import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:get/get.dart';
import 'package:retrofit/dio.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/models/address.dart';
import 'package:smartcommerce/models/cart.dart';
import 'package:smartcommerce/models/cupon.dart';
import 'package:smartcommerce/models/flashsale_products_model.dart';
import 'package:smartcommerce/models/mini_product.dart';
import 'package:smartcommerce/models/product_data.dart';
import 'package:smartcommerce/models/product_details_model.dart';
import 'package:smartcommerce/models/user_profile_model.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/utils/db/cart_db.dart';
import 'package:smartcommerce/utils/helper/auth_alert.dart';
import 'package:smartcommerce/utils/retrofit.dart';

class CartController extends GetxController {
  RestClient client = RestClient(
      Dio(BaseOptions(headers: Constants.headers, baseUrl: Constants.baseUrl)));

  CartDB db;
  RxList<Cart> _cartData = <Cart>[].obs;
  RxBool sendingOrder = RxBool(false);
  RxList<int> cartProcessList = RxList([]);

  updateClient() {
    client = RestClient(Dio(
        BaseOptions(headers: Constants.headers, baseUrl: Constants.baseUrl)));
    clearAll();
  }

  updateCartData() {
    _cartData.forEach((element) {
      checkIsAvailability(element.id);
    });
  }

  Future<Coupon> verifyCoupon(String code) async {
    Coupon coupon = await client.getCouponData(code);

    return coupon;
  }

  bool isValidating() {
    bool ret = false;
    for (int index = 0; index < _cartData.length; index++) {
      ret = _cartData[index].checking;
      if (ret == true) {
        return ret;
      }
    }
    return ret;
  }

  Future checkIsAvailability(int id) async {
    cartProcessList.add(id);
    update();
    int index =
        _cartData.indexOf(_cartData.firstWhere((element) => element.id == id));
    if (_cartData[index].checking == true) {
      return;
    }
    _cartData[index].checking = true;
    update();

    final MiniProduct data = await client.getProductCartValid(id);

    _cartData[index].updatePrices(data);
    db.updateSelectedCart(_cartData[index]);
    _cartData[index].checking = false;

    cartProcessList.remove(id);
    update();

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
    if (Get.put(AuthController()).apiToken != null) {
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
    } else {
      showAuthAlertDialog();
    }
  }

  void fromProduct(ProductDetailsModel product) async {
    if (Get.put(AuthController()).apiToken != null) {
      cartProcessList.add(product.id);
      var _checkItem =
          _cartData.where((element) => element.id == product.id).toList();

      if (_checkItem.isNotEmpty) {
        updateCount(product.id);
        cartProcessList.remove(product.id);

        return;
      } else {
        _cartData.add(
          Cart.fromProduct(product),
        );
        ProductDetailsModel data = await client.getProductDetails(product.id);

        updateItem(
          Cart.fromProductData(data),
        );
        db.addCart(_cartData.firstWhere((element) => element.id == product.id));
      }
      cartProcessList.remove(product.id);
    } else {
      showAuthAlertDialog();
    }
  }

  void fromProductFlashSale(FlashProduct product) async {
    if (Get.put(AuthController()).apiToken != null) {
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
    } else {
      showAuthAlertDialog();
    }
  }

  addFromFav(Wishlist product) async {
    if (Get.put(AuthController()).apiToken != null) {
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
    } else {
      showAuthAlertDialog();
    }
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
    if (_cartData[index].manageStock == false ||
        _cartData[index].cartQuantity < _cartData[index].stockQuantity) {
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
    update();
  }

  Future<bool> sendOrder(Address address, Coupon coupon,
      UserProfileModel userData, double shippingCost, double total) async {
    bool ret = false;
    Map<String, dynamic> data;
    sendingOrder.value = true;
    data = {
      "customer_id": userData.id.toString(),
      "customer_email": userData.email,
      "customer_phone": address.phoneNumber,
      "billing_address_1": address.addressLine,
      "shipping_address_1": address.addressLine,
      "billing_city": address.city,
      "shipping_city": address.city,
      "billing_zip": address.zipCode,
      "shipping_zip": address.zipCode,
      "billing_state": address.city,
      "shipping_state": address.city,
      "payment_method": "cod",
      "shipping_cost": shippingCost.toString(),
      "sub_total": totalPrice.toString(),
      "total": total.toString(),
      "locale": Get.locale.languageCode,
    };

    if (coupon != null) {
      data["coupon_id"] = coupon.id.toString();
      data["discount"] = coupon.valueAmount.toString();
    } else {
      data["discount"] = "0";
    }
    List<int> ids = [];
    List<String> prices = [];
    List<int> quantitys = [];
    List<String> totals = [];
    for (int index = 0; index < _cartData.length; index++) {
      // data["products_ids[${index.toString()}]"] = _cartData[index].id;
      // data["products_price[${index.toString()}]"] =
      //     _cartData[index].sellingPrice.amount;
      // data["products_qty[${index.toString()}]"] = _cartData[index].cartQuantity;
      // data["products_total[${index.toString()}]"] =
      //     (_cartData[index].cartQuantity *
      //             double.parse(_cartData[index].sellingPrice.amount))
      //         .toString();

      ids.add(_cartData[index].id);
      prices.add(
          _cartData[index].sellingPrice.inCurrentCurrency.amount.toString());
      quantitys.add(_cartData[index].cartQuantity);
      totals.add((_cartData[index].cartQuantity *
              double.parse(_cartData[index].sellingPrice.amount))
          .toString());
    }

    data["products_ids[]"] = ids;
    data["products_price[]"] = prices;
    data["products_qty[]"] = quantitys;
    data["products_total[]"] = totals;
    data["api_token"] = Get.put(AuthController()).apiToken.value;
    data["mobile_token"] = await FirebaseMessaging.instance.getToken();

    HttpResponse response = await client.orderConfirmation(data);
    if (response != null) {
      if (response.data.containsKey("success")) {
        ret = true;
      }
    }

    sendingOrder.value = false;

    return ret;
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
    update();
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
