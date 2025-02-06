import 'dart:ui';


import 'package:client_app/assets.dart';
import 'package:client_app/controllers/db_service.dart';
import 'package:client_app/home.dart';
import 'package:client_app/model/myproducts.dart';
import 'package:client_app/model/product.dart';
import 'package:client_app/model/productcard.dart';
import 'package:client_app/model/sub_categories_model.dart';
import 'package:client_app/pages/homepage.dart';
import 'package:client_app/responsive/responsive_layout.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaptopPage extends StatefulWidget {
  final String categoryName;
  final String titleText;
  final String selectedSub;
  const LaptopPage({super.key, required this.categoryName,required this.titleText, required this.selectedSub});

  @override
  State<LaptopPage> createState() => _LaptopPageState();
}

class _LaptopPageState extends State<LaptopPage> {
  final categories = ["All", "Lenovo","Asus","hp","Dell"];
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    String? selectedSubCategory = widget.selectedSub;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              ResponsiveLayout.isPhone(context)?Navigator.pop(context) : updateColumnContent('column1', HomePage());
              }, 
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: AppColors.selectedGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.arrow_back,color:AppColors.primary ))
            ),
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        elevation: 0, 
        toolbarHeight: height * 0.1, 
        actions: [
          IconButton(
            iconSize: 35,
            color: AppColors.textColor,
            icon: Icon(Icons.person_2_rounded),
            onPressed: () {},
          ),
          SizedBox(width: 15,)
        ],
        title: Text(
          widget.titleText,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent
                  ),
                  height:ResponsiveLayout.isPhone(context)? height* 0.32: height*0.4,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                    ),
                  
                  // child: Card(
                  //   elevation: 10,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(12)
                  //   ),
                    
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(12),
                  //     child: BackdropFilter(
                  //       filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10)
                  //       )
                  //       ),
                  // ),
                ),
              ),
              SizedBox(height: 20,),
              StreamBuilder<QuerySnapshot>(
                stream:  DbService().readSubCategoriesByCategory(widget.categoryName), 
                builder: (context,snapshot){
                  
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator()); // Loading indicator
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(child: Text("Error: ${snapshot.error}")); // Error message
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text("No subcategories found.")); // No data message
                  }
                  List<SubCategoriesModel> subcategories =
                  SubCategoriesModel.fromJsonList(snapshot.data!.docs);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: subcategories.map((subCategory){
                      final index = subcategories.indexOf(subCategory);
                      return GestureDetector(
                        onTap: (){
                            setState(() {
                          _selectedCategoryIndex = index;
                          selectedSubCategory = subCategory.name;
                        });
                        
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 18 ,vertical: 18),
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
                          gradient: selectedSubCategory == subCategory.name?AppColors.selectedGradient:  AppColors.diagonalGradient
                        ),
                        child: Center(
                          child: Text(subCategory.name, style:Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 9,
                          color: selectedSubCategory == subCategory.name? AppColors.primary: AppColors.textColor
                          ),
                          )
                          ),

                        ),
                      );
                    }).toList(),
                  );
                  
                }
                ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: categories.map((category){
              //     final index = categories.indexOf(category);
              //     return GestureDetector(
              //       onTap: () {
              //         setState(() {
              //           _selectedCategoryIndex = index;
              //         });
              //       },
              //       child: Container(
              //         padding: EdgeInsets.symmetric(horizontal: 18 ,vertical: 18),
              //         decoration: BoxDecoration(
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.white,
              //               offset: Offset(-1, -1), // Shadow position
              //               blurRadius: 2, // Shadow blur
              //               spreadRadius: 0.1,
              //             )
              //           ],
              //           borderRadius: BorderRadius.circular(12),
              //            gradient: _selectedCategoryIndex==index?AppColors.selectedGradient:  AppColors.diagonalGradient
              //         ),
              //         child: Center(
              //           child: Text(categories[index], style:Theme.of(context).textTheme.bodyMedium?.copyWith(
              //             fontSize: 9,
              //             color: _selectedCategoryIndex==index? AppColors.primary: AppColors.textColor
              //             ),
              //             )
              //         ),
              //       ),
              //     );
              //   }).toList()
              //   ),
                SizedBox(height:20),
                SizedBox(
                  child: StreamBuilder(
                    stream: DbService().readProductsBySubCategory(selectedSubCategory!), 
                    builder: (context,snapshot){
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text("Error loading products."),
                        );
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(
                          child: Text("No products found.",style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor,
                          ),),
                        );
                      }
                      List<Product> products = Product.fromJsonList(snapshot.data!.docs);
                      return _buildAllProducts(products);
                    }),)
            ],
            
            ),
        ),
      ),
    );
    
    
    
    
  }
  _buildAllProducts(List<Product> products) => GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100.0 / 160.0),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12
      ),
      scrollDirection: Axis.vertical,
      itemCount: products.length,
    itemBuilder: (context,index){ 
      final currentProduct = products[index];
      return ProductCard(product:currentProduct);
      }
    );
}
