import 'package:client_app/assets.dart';
import 'package:client_app/constants/discount.dart';
import 'package:client_app/providers/cart_provider.dart';
import 'package:client_app/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartContainer extends StatefulWidget {
  final String image, name, productId;
  final int newPrice, oldPrice, maxQuantity, selectedQuantity;

  const CartContainer({
    super.key,
    required this.image,
    required this.name,
    required this.productId,
    required this.newPrice,
    required this.oldPrice,
    required this.maxQuantity,
    required this.selectedQuantity,
  });

  @override
  State<CartContainer> createState() => _CartContainerState();
}

class _CartContainerState extends State<CartContainer> {
  @override
  Widget build(BuildContext context) {
    
    final currW =ResponsiveLayout.isLaptop(context)? 
    600:
    MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppColors.gradientEnd,
        child: Container(
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
                offset: Offset(-1, -1),
                blurRadius: 2,
                spreadRadius: 0.1,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center, // Align items properly
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    // width: currW * 0.25,
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                      // height: currW * 0.1,
                      // width:currW * 0.1, // Ensure fixed width for image
                    ),
                  ),
                ),
                // const SizedBox(width: 8),
                Spacer(),
                Expanded( // Ensures the right section takes up remaining space
                flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8,),
                      Text(
                        widget.name,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: currW * 0.05,
                            ),
                      ),
                      
                          SizedBox(height: 8,),
                      Row(
                        children: [
                          SizedBox(height: 8,),
                      Text(
                            "\₹${widget.oldPrice}",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: currW * 0.04,
                                  color: const Color.fromARGB(167, 188, 188, 188),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          SizedBox(width: 8,),
                          Text(
                            "\₹${widget.newPrice}",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: currW * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_downward,
                            color: Colors.green,
                            size: 20,
                          ),
                          Text(
                            "${discountPercent(widget.oldPrice, widget.newPrice)}%",
                            style: TextStyle(
                              fontSize: currW * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      TextButton(
                        onPressed:(){}, 
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textColor,
                            
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                          child: Text("Buy Now",
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppColors.primary,
                            fontSize: currW * 0.03,
                          ),),
                        )
                        ),
                        SizedBox(height: 10,),
                      
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                          // Distribute space properly
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                             // Fix the layout issue
                            IconButton(
                              onPressed: () async {
                                Provider.of<CartProvider>(context, listen: false)
                                    .removeFromCart(widget.productId);
                              },
                              icon: Icon(
                                Icons.delete,
                                size: currW*0.1,
                                color: Colors.red.shade400,
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
}
