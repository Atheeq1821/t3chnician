
import 'package:client_app/assets.dart';
import 'package:client_app/pages/homepage.dart';
import 'package:client_app/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  int curr_index = 0;
    final pages = [
      HomePage(),
      ProfilePage(),
      ProfilePage()
    ];  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text(
          "T3chnician",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
      ),
      body: pages[curr_index],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        elevation: 5,
        backgroundColor: AppColors.secondary,
        currentIndex: curr_index,
        onTap: (value) {
          setState(() {
            curr_index = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(curr_index==0? Icons.home :Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(curr_index==1 ? Icons.shopping_cart :Icons.shopping_cart_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(curr_index==2? Icons.person_2:Icons.person_2_outlined), label: ''),
        ],
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: AppColors.primary,
      ),
    );
  }
}