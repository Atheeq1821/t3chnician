import 'dart:async';
import 'package:client_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:client_app/controllers/db_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  StreamSubscription<DocumentSnapshot>? _userSubscription;

  String name ="User";
  String email ="";
  String address ="";
  String Mobilenumber ="";

  UserProvider(){
    loadUserData();
  }

   // load user profile data
  void loadUserData(){
   
     _userSubscription?.cancel();
    _userSubscription = DbService().readUserData().listen((snapshot) {
      print(snapshot.data());
      final UserModel data = UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
      name = data.name;
      email = data.email;
      address = data.address;
      Mobilenumber = data.Mobilenumber;
      notifyListeners();
    });
 
  }

  void cancelProvider(){
    _userSubscription?.cancel();
  }

  @override
  void dispose() {
    cancelProvider();
    super.dispose();
  }

  


}