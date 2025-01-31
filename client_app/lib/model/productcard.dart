
import 'package:client_app/assets.dart';
import 'package:client_app/model/cart_model.dart';
import 'package:client_app/model/product.dart';
import 'package:client_app/pages/productpage.dart';
import 'package:client_app/providers/cart_provider.dart';
import 'package:client_app/responsive/responsive_layout.dart';
import 'package:client_app/responsive/tablet/tab_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isSelected =false;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width /2,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        gradient: AppColors.diagonalGradient,
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
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                    // isSelected = !isSelected;
                    setState(() { 
                      if (cartProvider.cartUids.contains(widget.product.id)){
                      cartProvider.removeFromCart(widget.product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Removed from cart")),
                      );
                    }else{
                        cartProvider.addToCart(
                          CartModel(productId: widget.product.id, quantity: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Added to cart")),
                        );  
                    }
                    });
                    
                },
                child: Icon(
                  cartProvider.cartUids.contains(widget.product.id)? Icons.shopping_cart_rounded:Icons.shopping_cart_outlined,
                  color:cartProvider.cartUids.contains(widget.product.id)?Colors.redAccent: AppColors.secondary,
                ),
              ),
            ],
            ),
            SizedBox(height: 18,),
            SizedBox(
              // height: 130,
              // width: 150,
              child: Image.network(
                widget.product.image,
                fit: BoxFit.cover,
                loadingBuilder:  (context, child, loadingProgress){
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes!=null ?
                      loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1) : null,
                    ),
                    );
                },
                errorBuilder: (context, error, stackTrace){
                   return Center(
                      child: Text("Error loading image"),
                    );
                },
                ),
              ),
              SizedBox(height: 10,),
              Text(
              widget.product.name,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      // updateColumnContent('column2',TabProduct(product: widget.product,));
                      if(ResponsiveLayout.isPhone(context)){
                        Navigator.push(context
                        , MaterialPageRoute(
                            builder: (context) => ProductPage(product: widget.product,))
                        );
                      }
                      else{
                        updateColumnContent('column2', TabProduct(product: widget.product,));
                      }
                      // setState(() {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ProductPage(product: widget.product,)
                      //       )
                      //   );
                      // });
                    }, 
                    
                    style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                    backgroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Custom border radius
                            ),
                      ),
                      child: Text("View", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: AppColors.primary,
                        fontSize: 13
                      ),),
                    )
                  // TextButton(
                  //   style: TextButton.styleFrom(
                  //     padding: EdgeInsets.zero,
                  //     backgroundColor: AppColors.secondary
                  //   ),
                  //   onPressed: (){}, 
                  //   child: Text("View")
                  //   ),
                ],
              )
        ],
      ),
    );
  }
}