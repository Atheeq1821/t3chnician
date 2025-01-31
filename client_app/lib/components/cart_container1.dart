import 'package:client_app/assets.dart';
import 'package:client_app/constants/discount.dart';
import 'package:client_app/model/cart_model.dart';
import 'package:client_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartContainer extends StatefulWidget {
  final String image, name, productId;
  final int newPrice, oldPrice, maxQuantity, selectedQuantity;
  const CartContainer(
      {super.key,
      required this.image,
      required this.name,
      required this.productId,
      required this.newPrice,
      required this.oldPrice,
      required this.maxQuantity,
      required this.selectedQuantity});

  @override
  State<CartContainer> createState() => _CartContainerState();
}

class _CartContainerState extends State<CartContainer> {
  int count = 1;

  increaseCount(int max) async {
    if (count >= max) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Maximum Quantity reached"),
      ));
      return;
    } else {
      Provider.of<CartProvider>(context, listen: false)
          .addToCart(CartModel(productId: widget.productId, quantity: count));
      setState(() {
        count++;
      });
    }
  }


  @override
  void initState() {
    count=widget.selectedQuantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(    
        color: AppColors.third,   
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                     child: Image.network(widget.image, fit: BoxFit.cover,)
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(
                          widget.name,
                          maxLines: 2,
                        
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 20,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "\₹${widget.oldPrice}",
                              style:Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 20,
                            color: const Color.fromARGB(111, 7, 38, 56),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough
                          ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "\₹${widget.newPrice}",
                              style:Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 20,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.green,
                              size: 20,
                            ),
                            Text(
                              "${discountPercent(widget.oldPrice, widget.newPrice)}%",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () async {
                          Provider.of<CartProvider>(context, listen: false)
                              .removeFromCart(widget.productId);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red.shade400,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 8, 
              ),
              Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Spacer(),
                  Text("Total:"),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "\₹${widget.newPrice * count}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
