import 'package:client_app/assets.dart';
import 'package:client_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabProduct extends StatelessWidget {
  final Product product;

  const TabProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          elevation: 0,
          toolbarHeight: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: double.infinity,
                        decoration: BoxDecoration(
                        gradient: AppColors.doubleGradient
                        ),
                  child:Container(
                    padding: EdgeInsets.all(30),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(topLeft: Radius.circular(20) ,topRight:Radius.circular(20) ),
                    gradient: AppColors.diagonalGradient
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.all(16),
                      
                      decoration: BoxDecoration(
                        color: Color(0xff323B4F),
                        boxShadow: [     
                            BoxShadow(
                              color: Color(0xFF38445A), // First shadow color
                              offset: Offset(-4, -4), // x: -4, y: -4
                              blurRadius: 10, // Blur radius
                            ),
                            BoxShadow(
                              color: Color(0xFF252B39), // Second shadow color
                              offset: Offset(4, 4), // x: 4, y: 4
                              blurRadius: 10, // Blur radius
                            ),
                          ],
                      ),
                      child: Text("Specification",
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )
                        ),
                      ),
                      Spacer(),
                      Container(
                        constraints: BoxConstraints(
                        // maxHeight: MediaQuery.of(context).size.height * 0.4,
                        ),
                        child: SingleChildScrollView(
                          child: Table(
                            columnWidths: const {
                                  0: FlexColumnWidth(2), // Adjust width of the first column
                                  1: FlexColumnWidth(1), // Adjust width of the separator column
                                  2: FlexColumnWidth(3), // Adjust width of the second column
                                },
                            children: [
                              _buildTableRow('NAME',product.name),
                              
                              _buildTableRow('PROCESSOR',product.processor),
                              
                              _buildTableRow('RAM ',(product.ram).toString()),
                              
                              _buildTableRow('STORAGE ', (product.storage).toString()),
                              _buildTableRow('SCREENSIZE ', (product.screenSize).toString()),
                              
                              
                              _buildTableRow('WINDOWS ',product.windows),
                              
                              _buildTableRow('BATTERY ',product.battery),
                              
                              _buildTableRow('ADDITIONAL INFO ',product.additionalInfo),
                              _buildTableRow('CONDITION ',product.condition),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        // width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(1, 1),
                                        blurRadius: 10,
                                        spreadRadius: 0.3,
                                      ),
                                      BoxShadow(
                                        color: const Color.fromARGB(132, 255, 255, 255),
                                        offset: Offset(-1, -1), // Shadow position
                                        blurRadius: 2, // Shadow blur
                                        spreadRadius: 0.1,
                                      ),
                                      
                                      ],
                        borderRadius: BorderRadius.circular(20),
                        gradient: AppColors.diagonalGradient
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('₹${product.oldPrice}',
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: AppColors.secondary
                            )
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary
                              ),
                              onPressed: (){}, 
                              child: Text(
                                "Buy now",
                                style: TextStyle(color: AppColors.primary),
                                )
                              )
                            ],
                          ),
                        ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

      );
  }
  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
              color: AppColors.secondary,
              fontSize: 16,
              fontWeight: FontWeight.w900
              )
            )
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(':', style: TextStyle(fontSize: 16)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            value,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
              color: AppColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w900
              )
            ),
          ),
        ),
      ],
    );
  }
  
}