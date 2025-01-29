import 'package:client_app/assets.dart';
import 'package:client_app/home.dart';
import 'package:client_app/firebase_options.dart';
import 'package:client_app/pages/appStart/onboard.dart';
import 'package:client_app/responsive/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'eCommerce App',
        debugShowCheckedModeBanner: false,
        home:OnboardScreen(),
        // home: WidgetTree(),
        theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
        ),
        bodyMedium: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.normal,
            color: AppColors.textColor,
          ),
        displaySmall: TextStyle(
          color: AppColors.secondary,
          fontSize: 15,
        )
      ),
      
      scaffoldBackgroundColor: AppColors.primary,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: AppColors.textColor,
            
          )
        ),
        useMaterial3: true
      ),
    );
  }
}
