import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String processor;
  final int newPrice;
  final int oldPrice;
  final String ram;
  final String storage;
  final String screenSize;
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
    required this.oldPrice,
    required this.newPrice,
    required this.image,
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
      // description: json["desc"] ?? "no description",
      image: json["image"] ?? "",
      newPrice: json["new_price"] ?? 0,
      oldPrice: json["old_price"] ?? 0,
      category: json["category"] ?? "",
      subCategory: json["sub category"] ?? "", // Match Firestore field name
      processor: json["processor"] ?? "",
      ram: json["ram"] ?? "",
      storage: json["storage"] ?? "",
      screenSize: json["screensize"] ?? "",
      windows: json["windows"] ?? "",
      battery: json["battery"] ?? "",
      condition: json["condition"] ?? "",
      additionalInfo: json["additionalinfo"] ?? "",
      quantity: json["quantity"] ?? 0,
      id: id,
    );
  }
  static List<Product> fromJsonList(List<QueryDocumentSnapshot> list) {
    return list.map((e) {
      // print("Parsing product: ${e.data()}");  // To debug
      return Product.fromJson(e.data() as Map<String, dynamic>, e.id);
    }).toList();
}
}