import 'package:client_app/assets.dart';
import 'package:client_app/components/cart_container.dart';
import 'package:client_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget { 
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " Your Cart",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            Expanded(
              child: Consumer<CartProvider>(
                builder: (context, value, child){
                  if (value.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else{
                    if (value.carts.isEmpty) {
                      return Center(
                        child: Text(
                          "No items in cart",
                          style: TextStyle(color: AppColors.textColor),
                        ),
                      );
                    } else{
                      if (value.products.isNotEmpty) {
                        return ListView.builder(
                          itemCount: value.carts.length,
                          itemBuilder: (context, index) {
                            print("selected ${value.carts[index].quantity}");
                            return CartContainer(
                              image: value.products[index].image,
                              name: value.products[index].name,
                              newPrice: value.products[index].newPrice,
                              oldPrice: value.products[index].oldPrice,
                              maxQuantity: value.products[index].quantity,
                              selectedQuantity: value.carts[index].quantity,
                              productId: value.products[index].id,
                            );
                          },
                        );
                      } else{
                        return Center(
                          child: Text(
                            "No items in cart",
                            style: TextStyle(color: AppColors.textColor),
                          ),
                        );
                      }
                    }
                  }
                },
              ),
              )
          ],
          ),
        ),
    );
  }
}