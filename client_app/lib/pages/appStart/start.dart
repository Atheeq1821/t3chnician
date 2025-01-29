
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 20),
                width: double.infinity,
                child: Column(        
                  crossAxisAlignment: CrossAxisAlignment.center, 
                  mainAxisAlignment: MainAxisAlignment.center,      
                  children: [
                    Spacer(), 
                    SizedBox(
                      width:240,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    SizedBox(height: 20,),
                    Text("✨ Best Prices. Trusted Service. ✨",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 20,
                      color: Colors.white
                    ),
                    ),
                    Spacer(flex: 2,),
                    // Text("Swipe to get started >>",
                    // style: TextStyle(
                    //   fontSize: 13,
                    //   color: AppColors.secondary
                    // ),),
                    // Spacer(flex: 2,)
                  ],
                
                )
    );

  }
}