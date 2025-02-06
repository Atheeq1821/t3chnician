import 'package:cloud_firestore/cloud_firestore.dart';

class SpareModel {
  final String id;
  final String name;
  final String image;
  final String description;
  int quantity;
  final String category;
  final String subCategory;
  SpareModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.quantity,
    required this.category,
    required this.subCategory,
    
  });

  factory SpareModel.fromJson(Map<String, dynamic> json, String id) {
    return SpareModel(
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      description: json[""] ?? "",
      quantity: json["quantity"]?? 0,
      category: json["category"] ?? "",
      subCategory: json["subCategory"] ?? "",
      id: id,
    );
  }

  // Convert a list of Firestore documents to a list of ProductsModel
 static List<SpareModel> fromJsonList(List<QueryDocumentSnapshot> list) {
  return list.map((e) {
    print("Parsing product: ${e.data()}");  // To debug
    return SpareModel.fromJson(e.data() as Map<String, dynamic>, e.id);
  }).toList();
}
}