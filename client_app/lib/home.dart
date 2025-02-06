
import 'package:client_app/assets.dart';
import 'package:client_app/pages/cartpage.dart';
import 'package:client_app/pages/enquiry.dart';
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
      EnquiryPage(),
      CartPage(),
      ProfilePage()
    ];  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "T3chnician",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
      ),
      body: pages[curr_index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.primary, // Set the background color here
        ),
        child: BottomNavigationBar(
          iconSize: 30,
          elevation: 5,
          backgroundColor: Colors.transparent, // Keep it transparent
          type: BottomNavigationBarType.fixed, // Add this line
          currentIndex: curr_index,
          onTap: (value) {
            setState(() {
              curr_index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                  gradient: curr_index == 0 ? AppColors.selectedGradient : null,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(0, curr_index == 0 ? -5 : 0, 0),
                child: Icon(Icons.home),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                  gradient: curr_index == 1 ? AppColors.selectedGradient : null,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(0, curr_index == 1 ? -5 : 0, 0),
                child: Icon(Icons.question_answer),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                  gradient: curr_index == 2 ? AppColors.selectedGradient : null,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(0, curr_index == 2 ? -5 : 0, 0),
                child: Icon(Icons.shopping_cart),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                  gradient: curr_index == 3 ? AppColors.selectedGradient : null,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(0, curr_index == 3 ? -5 : 0, 0),
                child: Icon(Icons.person),
              ),
              label: '',
            ),
          ],
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textColor,
        ),
      ),
    );
  }
}

