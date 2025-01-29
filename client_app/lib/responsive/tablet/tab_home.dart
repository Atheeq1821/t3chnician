import 'dart:ui';


import 'package:client_app/assets.dart';
import 'package:client_app/pages/laptops.dart';
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
                GestureDetector(
                  onTap: () {
                    updateColumnContent('column1',LaptopPage(categoryName: "laptop",titleText: "Choose Your Laptop",));
                    // setState(() {
                    //   selectedCategoryIndex.value=1;
                    // });
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
                       gradient: _selectedCategoryIndex==1?AppColors.selectedGradient:  AppColors.diagonalGradient
                    ),
                    child: Center(
                      child: Text(categories[1], style: TextStyle(
                        fontSize: 12,
                        color: _selectedCategoryIndex==1? AppColors.primary: AppColors.textColor
                        ),
                        )
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = 2;
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
                       gradient: _selectedCategoryIndex==2?AppColors.selectedGradient:  AppColors.diagonalGradient
                    ),
                    child: Center(
                      child: Text(categories[2],style: TextStyle(
                        fontSize: 12,
                        color: _selectedCategoryIndex==2? AppColors.primary: AppColors.textColor
                        ),
                        )
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = 3;
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
                       gradient: _selectedCategoryIndex==3?AppColors.selectedGradient:  AppColors.diagonalGradient
                    ),
                    child: Center(
                      child: Text(categories[3], style: TextStyle(
                        fontSize: 12,
                        color: _selectedCategoryIndex==3? AppColors.primary: AppColors.textColor
                        ),
                        )
                    ),
                  ),
                ),
      
              ],
              ),
              SizedBox(height: 20,),
          ],
          ),
      ),
    );
  }
}