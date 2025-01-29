import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

class DbService {
  User? user = FirebaseAuth.instance.currentUser;

  // USER DATA
  Future saveUserData({required String name, required String email, required String Mobilenumber}) async {
    try {
      Map<String, dynamic> data = {
        "name": name,
        "email": email,
        "Mobilenumber": Mobilenumber,
      };
      await FirebaseFirestore.instance
          .collection("shop_users")
          .doc(user!.uid)
          .set(data);
    } catch (e) {
      print("Error saving user data: $e");
    }
  }

  Future<void> updateUserData({required Map<String, dynamic> extraData}) async {
  DocumentReference userDoc = FirebaseFirestore.instance
      .collection("shop_users")
      .doc(user!.uid);

  print("Updating user document with ID: ${user!.uid}");
  
  try {
    DocumentSnapshot docSnapshot = await userDoc.get();
    if (docSnapshot.exists) {
      print("Document exists. Updating...");
      await userDoc.update(extraData);
    } else {
      print("Document does not exist. Creating new document...");
      await userDoc.set(extraData);
    }
  } catch (e) {
    print("Error updating user data: $e");
  }
}


  Stream<DocumentSnapshot> readUserData() {
    return FirebaseFirestore.instance
        .collection("shop_users")
        .doc(user!.uid)
        .snapshots();
  }

  // PROMOS AND BANNERS
  Stream<QuerySnapshot> readPromos() {
    return FirebaseFirestore.instance.collection("shop_promos").snapshots();
  }

  Stream<QuerySnapshot> readBanners() {
    return FirebaseFirestore.instance.collection("shop_banners").snapshots();
  }

  // DISCOUNTS
  Stream<QuerySnapshot> readDiscounts() {
    return FirebaseFirestore.instance
        .collection("shop_coupons")
        .orderBy("discount", descending: true)
        .snapshots();
  }

  Future<QuerySnapshot> verifyDiscount({required String code}) {
    return FirebaseFirestore.instance
        .collection("shop_coupons")
        .where("code", isEqualTo: code)
        .get();
  }

  // CATEGORIES
  Stream<QuerySnapshot> readCategories() {
    return FirebaseFirestore.instance
        .collection("shop_categories")
        // .orderBy("priority", descending: true)
        .snapshots();
  }

  // Subcategories for a specific category
  Stream<QuerySnapshot> readSubCategoriesByCategory(String category) {
  return FirebaseFirestore.instance
      .collection("shop_subcategories")
      .where("category", isEqualTo: category)
      .snapshots();
}


  // PRODUCTS
  // Fetch products by subcategory
  Stream<QuerySnapshot> readProductsBySubCategory(String subcategory) {
    return FirebaseFirestore.instance
        .collection("shop_products")
        .where("sub category", isEqualTo: subcategory)
        .snapshots();
  }
  
  // Fetch products by document IDs
  Stream<QuerySnapshot> searchProducts(List<String> docIds) {
    return FirebaseFirestore.instance
        .collection("shop_products")
        .where(FieldPath.documentId, whereIn: docIds)
        .snapshots();
  }

  Future reduceQuantity(
      {required String productId, required int quantity}) async {
    await FirebaseFirestore.instance
        .collection("shop_products")
        .doc(productId)
        .update({"quantity": FieldValue.increment(-quantity)});
  }

  // CART
  Stream<QuerySnapshot> readUserCart() {
    return FirebaseFirestore.instance
        .collection("shop_users")
        .doc(user!.uid)
        .collection("cart")
        .snapshots();
  }


  Future deleteItemFromCart({required String productId}) async {
    await FirebaseFirestore.instance
        .collection("shop_users")
        .doc(user!.uid)
        .collection("cart")
        .doc(productId)
        .delete();
  }

  Future emptyCart() async {
    await FirebaseFirestore.instance
        .collection("shop_users")
        .doc(user!.uid)
        .collection("cart")
        .get()
        .then((value) {
      for (DocumentSnapshot ds in value.docs) {
        ds.reference.delete();
      }
    });
  }

  Future decreaseCount({required String productId}) async {
    await FirebaseFirestore.instance
        .collection("shop_users")
        .doc(user!.uid)
        .collection("cart")
        .doc(productId)
        .update({"quantity": FieldValue.increment(-1)});
  }

  // ORDERS
  Future createOrder({required Map<String, dynamic> data}) async {
    await FirebaseFirestore.instance.collection("shop_orders").add(data);
  }

  Future updateOrderStatus(
      {required String docId, required Map<String, dynamic> data}) async {
    await FirebaseFirestore.instance
        .collection("shop_orders")
        .doc(docId)
        .update(data);
  }

  Stream<QuerySnapshot> readOrders() {
    return FirebaseFirestore.instance
        .collection("shop_orders")
        .where("user_id", isEqualTo: user!.uid)
        .orderBy("created_at", descending: true)
        .snapshots();
  }
}