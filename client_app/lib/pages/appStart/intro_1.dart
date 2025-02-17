
import 'package:client_app/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Introduction1 extends StatelessWidget {
  const Introduction1({super.key});

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
            child: SvgPicture.asset("assets/svgs/intro1.svg"),
          ),
          SizedBox(height: 15,),
          Text("1 DAY SERVICE POLICY",
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.secondary,
              fontSize: 25
            ),
          ),
          SizedBox(height: 15,),
          Text("Our commitment to you: Fast \n and reliable services delivered \n within 1 day",
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