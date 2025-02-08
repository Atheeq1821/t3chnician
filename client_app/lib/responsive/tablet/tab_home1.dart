import 'dart:ui';


import 'package:client_app/assets.dart';
import 'package:client_app/pages/laptops.dart';
import 'package:client_app/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
final categories = ["All", "Laptops","Desktops","Spares"];
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveLayout.isPhone(context)?
        null: 
        AppBar(
        centerTitle: true,
        title: Text(
          "T3chnician",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20,),
            Center(
              child: SizedBox(
                height: 190,
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10)
                      )
                      ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoriesRow("laptop", "Choose Your Laptop", 1, "HP"),
                  _buildCategoriesRow("desktop", "Build Your Dream PC", 2,"HP"),
                  _buildCategoriesRow("spares", "All spares at one place", 3, "BATTERY"),
              ],
              ),
              SizedBox(height: 20,),
          ],
          ),
      ),
    );
  } 
Widget _buildCategoriesRow(String categoryName, String titleText, int index, String firstSubCategory){
  return GestureDetector(
          onTap: () {
            setState(() {
              _selectedCategoryIndex = index;
              ResponsiveLayout.isPhone(context)
              ?
                Navigator.push(
                  context,                         //"laptop"  "Choose Your Laptop"
                  MaterialPageRoute(
                    builder: (context) => LaptopPage(categoryName:categoryName ,titleText: titleText,selectedSub:firstSubCategory )
                  )
                )
              :
                updateColumnContent('column1',LaptopPage(categoryName:categoryName ,titleText: titleText,selectedSub:firstSubCategory));
            }); 
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 18),
            decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(-1, -1), // Shadow position
                blurRadius: 2, // Shadow blur
                spreadRadius: 0.1,
              )
            ],
            borderRadius: BorderRadius.circular(12),
            gradient: _selectedCategoryIndex==index?AppColors.selectedGradient:  AppColors.diagonalGradient
          ),
          child: Center(
            child: Text(categories[index], 
              style:TextStyle(
                fontSize: 12,
                color: _selectedCategoryIndex==index? AppColors.primary: AppColors.textColor
              ),
            )
          ),
        ),
      );
  }
}