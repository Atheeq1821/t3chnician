import 'package:client_app/assets.dart';
import 'package:client_app/controllers/auth_service.dart';
import 'package:client_app/home.dart';
import 'package:client_app/firebase_options.dart';
import 'package:client_app/pages/about.dart';
import 'package:client_app/pages/appStart/onboard.dart';
import 'package:client_app/pages/cartpage.dart';
import 'package:client_app/pages/enquiry.dart';
import 'package:client_app/pages/laptops.dart';
import 'package:client_app/pages/product_page.dart';
import 'package:client_app/pages/profilePage.dart';
import 'package:client_app/providers/cart_provider.dart';
import 'package:client_app/providers/user_provider.dart';
import 'package:client_app/responsive/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>  UserProvider(),),
        ChangeNotifierProvider(create: (context) =>  CartProvider(),),
      ],
      child: MaterialApp(
          title: 'eCommerce App',
          debugShowCheckedModeBanner: false,
          // home:OnboardScreen(),
          // home: WidgetTree(),
          theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          displayMedium: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight .bold,
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

        routes: {
          "/":(context)=> CheckUser(),
          "/welcome":(context)=> OnboardScreen(),
          "/home":(context)=> WidgetTree(),
          "/about":(context)=> About(),
          "/cart":(context)=> CartPage(),
          "/profile":(context)=> ProfilePage(), 
          "/enquiry":(context) => EnquiryPage(),
          // "/specific":(context)=> LaptopPage(categoryName: categoryName, titleText: titleText)
          // "/productPage":(context)=> ProductPage()

        },
      ),
    );
  }
}

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {

  @override
  void initState() {
    AuthService().isLoggedIn().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        Navigator.pushReplacementNamed(context, "/welcome");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  Center(child: CircularProgressIndicator(),),);
  }
}
