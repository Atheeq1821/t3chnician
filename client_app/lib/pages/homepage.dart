import 'dart:ui';


import 'package:client_app/assets.dart';
import 'package:client_app/components/location.dart';
import 'package:client_app/components/promo_container.dart';
import 'package:client_app/pages/about.dart';
import 'package:client_app/pages/laptops.dart';
import 'package:client_app/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final categories = ["All", "Laptops","Desktops","Spares"];
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedCategoryIndex = 0;
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: ResponsiveLayout.isPhone(context)?
          null: 
          AppBar(
            automaticallyImplyLeading: false,
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
                child: PromoContainer()
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.center,
                child: Container(
                  // width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 18),
                  decoration: BoxDecoration(
                    gradient: AppColors.selectedGradient,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("  Explore Our Shop ",                      
                      textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: AppColors.primary
                        )
                      ),
                      SizedBox(width: 5,),
                      Icon(Icons.arrow_downward,color: AppColors.primary,)
                    ],
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
                ResponsiveLayout.isPhone(context)?
                About():
                SizedBox.shrink(),
                MapScreen()

            ],
            ),
        ),
      ),
    );
  }
Widget _buildCategoriesRow(String categoryName, String titleText, int index, String firstSubCategory){
  return GestureDetector(
          onTapDown: (_) {
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