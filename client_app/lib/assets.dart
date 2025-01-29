// import 'package:ecomm/pages/about.dart';
// import 'package:ecomm/pages/appStart/login.dart';
// import 'package:ecomm/pages/cartpage.dart';
// import 'package:ecomm/responsiveness/tablet/about_tab.dart';
// import 'package:ecomm/responsiveness/tablet/tab_home.dart';
import 'package:client_app/home.dart';
import 'package:client_app/pages/about.dart';
import 'package:client_app/pages/appStart/login.dart';
import 'package:client_app/responsive/tablet/about_tab.dart';
import 'package:client_app/responsive/tablet/tab_home.dart';
import 'package:flutter/material.dart';
import 'dart:math';
final ValueNotifier<Map<String, Widget?>> columnContentNotifier =
    ValueNotifier<Map<String, Widget?>>({
  "column1": HomeTab(), // Default content for column 1
  "column2": AboutTab(),
  'column3': null ,
  'logincontrol':LoginPage() // Default content for column 2
});

void updateColumnContent(String columnKey, Widget newContent) {
  // columnContentNotifier.value = {
  //   ...columnContentNotifier.value,
  //   columnKey: newContent,
  // };
   final updatedValue = {
    ...columnContentNotifier.value,
    columnKey: newContent,
  };
   if (columnKey == 'column1' && newContent is Homeview) {
    updatedValue["column2"] = About();
  }
  columnContentNotifier.value = updatedValue;
}



class AppColors {
  static const Color gradientStart = Color(0xFF353F54); // #353F54
  static const Color gradientEnd = Color(0xFF222834);   // #222834
  static const Color secondary = Color(0xFFF2C987);
  static const Color third = Color(0xFF997346);
  static const Color violetG = Color(0xFF8542fc); 
  static const Color blueG = Color(0xFF34b4fe);
  static const Color primary = Color(0xFF072638); // #F79D65
  static const textColor =Color(0xFFBCBCBC);
  static const LinearGradient diagonalGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient selectedGradient = LinearGradient(
    colors: [secondary,third ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static  LinearGradient doubleGradient = LinearGradient(
    colors:   [secondary, // Hex for #eee
                primary,],
                stops: [0.50,0.50],
   begin: Alignment(cos(10 * pi / 180), sin(10 * pi / 180)), // 45° angle
    end: Alignment(-cos(10 * pi / 180), -sin(10 * pi / 180)), // Opposite end
  );
}