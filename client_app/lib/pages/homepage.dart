import 'dart:ui';


import 'package:client_app/assets.dart';
import 'package:client_app/home.dart';
import 'package:client_app/pages/about.dart';
import 'package:client_app/pages/laptops.dart';
import 'package:client_app/pages/profilePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categories = ["All", "Laptops","Desktops","Spares"];
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
                  setState(() {
                    _selectedCategoryIndex = 1;
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LaptopPage(categoryName: "laptop",titleText: "Choose Your Laptop",)
                            )
                        );
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
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LaptopPage(categoryName: "spares",titleText: "All spares at one place",)
                            )
                        );
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
            About()
        ],
        ),
    );
  }
}