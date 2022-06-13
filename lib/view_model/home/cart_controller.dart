import 'dart:developer';

import 'package:ecommerce_app/database/cart_database_helper.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool isLoading = false.obs;
  List<CartProductModel> _cartProductList = [];
  List<CartProductModel> get cartProductList => _cartProductList;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  final database = CartDatabaseHelper.cartDatabaseHelper;

  addProductToCart(CartProductModel cartProductModel) async {
    final database = CartDatabaseHelper.cartDatabaseHelper;

    for (int i = 0; i < cartProductList.length; i++) {
      if (_cartProductList[i].productId == cartProductModel.productId) {
        return;
      }
    }
    await database.insertToDatabase(cartProductModel);
    _cartProductList.add(cartProductModel);
    _totalPrice +=
        (double.parse(cartProductModel.price!) * cartProductModel.quantity!);
    Get.snackbar("Product successfullu added", "");
    update();
  }

  getAllCartProduct() async {
    isLoading.value = true;
    _cartProductList = await database.getAllData();
    log("cartProductList ${cartProductList.length}");
    getTotalPrice();
    isLoading.value = false;
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductList.length; i++) {
      _totalPrice += (double.parse(_cartProductList[i].price!) *
          _cartProductList[i].quantity!);
    }
  }

  increaseQuanity(int index) async {
    _cartProductList[index].quantity = _cartProductList[index].quantity! + 1;
    _totalPrice += (double.parse(_cartProductList[index].price!));
    await database.updateData(_cartProductList[index]);
    update();
  }

  decreaseQuanity(int index) async {
    if (_cartProductList[index].quantity! <= 0) {
      return;
    }
    _cartProductList[index].quantity = _cartProductList[index].quantity! - 1;
    _totalPrice -= (double.parse(_cartProductList[index].price!));
    await database.updateData(_cartProductList[index]);

    update();
  }

  CartController() {
    getAllCartProduct();
  }
  @override
  void dispose() {
    _cartProductList.clear();
    // TODO: implement dispose
    super.dispose();
  }
}
