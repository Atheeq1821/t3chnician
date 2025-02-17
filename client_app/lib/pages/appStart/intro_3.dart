import 'package:client_app/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Introduction3 extends StatelessWidget {
  const Introduction3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SizedBox(
            height: 240,
            child: SvgPicture.asset("assets/svgs/intro3.svg"),
          ),
          SizedBox(height: 15,),
          Text("BUY AND SELL",
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.secondary,
              fontSize: 25
            ),
          ),
          SizedBox(height: 15,),
          Text("Whether you're looking to buy or \n sell, t3chnician makes it seamless \n and secure.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: AppColors.textColor,
            fontSize: 20
          ),
          ),
          Spacer(flex: 2,)
        ],
      ),
    );
  }
}