import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String processor;
  final double price;
  final int ram;
  final int storage;
  final String storageType;
  final double screenSize;
  final String windows;
  final String battery;
  final String additionalInfo;
  final String condition;
  final String image;
  int quantity;
  final String category;
  final String subCategory;
  Product({
    required this.id,
    required this.name,
    required this.processor,
    required this.ram,
    required this.storage,
    required this.price,
    required this.image,
    required this.storageType,
    required this.screenSize,
    required this.windows,
    required this.battery,
    required this.additionalInfo,
    required this.condition,
    required this.quantity,
    required this.category,
    required this.subCategory,
  });

  factory Product.fromJson(Map<String, dynamic> json, String id) {
    return Product(
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      price: json["new_price"] ?? 0,
      category: json["category"] ?? "",
      subCategory: json["sub category"] ?? "", // Match Firestore field name
      processor: json["processor"] ?? "",
      ram: json["RAM"] ?? "",
      storage: json["storage"] ?? "",
      storageType: json["storageType"] ?? "",
      screenSize: json["screensize"] ?? "",
      windows: json["windows"] ?? "",
      battery: json["battery"] ?? "",
      condition: json["condition"] ?? "",
      additionalInfo: json["additionalinfo"] ?? "",
      quantity:json["quantity"] ?? 1,
      id: id,
    );
  }

  // Convert a list of Firestore documents to a list of ProductsModel
 static List<Product> fromJsonList(List<QueryDocumentSnapshot> list) {
  return list.map((e) {
    print("Parsing product: ${e.data()}");  // To debug
    return Product.fromJson(e.data() as Map<String, dynamic>, e.id);
  }).toList();
}
}