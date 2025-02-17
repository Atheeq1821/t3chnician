import 'package:client_app/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Introduction2 extends StatelessWidget {
  const Introduction2({super.key});

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
            child: SvgPicture.asset("assets/svgs/intro2.svg"),
          ),
          SizedBox(height: 15,),
          Text("24 / 7 SUPPORT",
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.secondary,
              fontSize: 25
            ),
          ),
          SizedBox(height: 15,),
          Text("T3chnician is here to help you anytime, \n anywhere. Reach out to us whenever \n you need",
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