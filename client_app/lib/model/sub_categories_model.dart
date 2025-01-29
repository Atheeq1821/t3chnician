import 'package:cloud_firestore/cloud_firestore.dart';

class SubCategoriesModel{
  String name, image,id;

SubCategoriesModel({
  required this.id,
  required this.name,
  required this.image,
  
});

// convert to json to object model
 factory SubCategoriesModel.fromJson(Map<String,dynamic> json,String id){
    return SubCategoriesModel(
      name: json["subcategory name"]??"",
      image: json["image"]??"",
      id: id,
    );
  }
    // Convert List<QueryDocumentSnapshot> to List<CategoriesModel>
  static List<SubCategoriesModel> fromJsonList(List<QueryDocumentSnapshot> list) {
    return list.map((e) => SubCategoriesModel.fromJson(e.data() as Map<String, dynamic>, e.id)).toList();
  }

}