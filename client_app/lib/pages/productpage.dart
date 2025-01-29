import 'package:client_app/assets.dart';
import 'package:client_app/model/product.dart';
import 'package:client_app/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: AppColors.doubleGradient),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            elevation: 0,
            toolbarHeight: 100,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: AppColors.selectedGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.arrow_back, color: AppColors.primary),
              ),
            ),
            title: Text(
              product.name,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView( // Wrap the entire body in a scroll view
            child: Column(
              children: [
                // Main content area
                SizedBox(
                  height: ResponsiveLayout.isPhone(context) ? width * 0.4 : 50,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.all(30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    gradient: AppColors.diagonalGradient,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xff323B4F),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF38445A),
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                            ),
                            BoxShadow(
                              color: Color(0xFF252B39),
                              offset: Offset(4, 4),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Text(
                          "Specification",
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: height * 0.4, // Use screen height as a limit
                        ),
                        child: SingleChildScrollView(
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(3),
                            },
                            children: [
                              _buildTableRow('NAME', product.name),
                              _buildTableRow('PROCESSOR', product.processor),
                              _buildTableRow('RAM ', (product.ram).toString()),
                              _buildTableRow('STORAGE ', (product.storage).toString()),
                              _buildTableRow('SCREENSIZE ', (product.screenSize).toString()),
                              _buildTableRow('WINDOWS ', product.windows),
                              _buildTableRow('BATTERY ', product.battery),
                              _buildTableRow('ADDITIONAL INFO ', product.additionalInfo),
                              _buildTableRow('CONDITION ', product.condition),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
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
                              offset: Offset(-1, -1),
                              blurRadius: 2,
                              spreadRadius: 0.1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          gradient: AppColors.diagonalGradient,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '₹${product.oldPrice}',
                                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                        color: AppColors.secondary,
                                      ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.secondary,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Buy now",
                                    style: TextStyle(color: AppColors.primary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                  color: AppColors.secondary, fontSize: 16, fontWeight: FontWeight.w900),
            ),
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
                  color: AppColors.textColor, fontSize: 16, fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ],
    );
  }
}
