import 'dart:async';
import 'package:client_app/model/cart_model.dart';
import 'package:client_app/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:client_app/controllers/db_service.dart';

import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  
  StreamSubscription<QuerySnapshot>? _cartSubscription;
  StreamSubscription<QuerySnapshot>? _productSubscription;

  bool isLoading = true;

  List<CartModel> carts = [];
  List<String> cartUids=[]; 
  List<Product> products = [];
  int totalCost = 0;
  int totalQuantity = 0;

 CartProvider(){
    readCartData();
  }

  void readCartData() {
    isLoading = true;
    _cartSubscription?.cancel();
    _cartSubscription = DbService().readUserCart().listen((snapshot) {
      List<CartModel> cartsData =
          CartModel.fromJsonList(snapshot.docs) as List<CartModel>;

      carts = cartsData;

      cartUids = [];
      for (int i = 0; i < carts.length; i++) {
        cartUids.add(carts[i].productId);
        print("cartUids: ${cartUids[i]}");
      }
      if (carts.length > 0) {
        readCartProducts(cartUids);
      }
      isLoading = false;
      notifyListeners();
    });
  }

  void readCartProducts(List<String> uids) {
    _productSubscription?.cancel();
    _productSubscription = DbService().searchProducts(uids).listen((snapshot) {
      List<Product> productsData =
          Product.fromJsonList(snapshot.docs) as List<Product>;
      products = productsData;
      isLoading = false;
      // addCost(products, carts); // Calculate total cost
      // calculateTotalQuantity();
      notifyListeners();
    });
  }

   // add product to the cart along with quantity
  void addToCart(CartModel cartModel) {
    DbService().addToCart(cartData: cartModel);
    notifyListeners();
  }
  void removeFromCart(String productId) {
    DbService().deleteItemFromCart(productId: productId);
    notifyListeners();
  }

  void cancelProvider(){
    _cartSubscription?.cancel();
    _productSubscription?.cancel();
  }

  @override
  void dispose() {
    cancelProvider();
    super.dispose();
  }
}