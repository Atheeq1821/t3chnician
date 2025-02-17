
import 'package:client_app/assets.dart';
import 'package:client_app/components/about-card.dart';
import 'package:client_app/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style:  Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 30
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              // height: ResponsiveLayout.isPhone(context) ? 80: ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12)
              ),
              child: ClipRRect( 
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/about.png",
                fit: BoxFit.cover
                ),
              )
            ),
            SizedBox(height: 10,),
            Text(
              "Buy laptops online at the best price in India",
              style:  Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Smartphones have taken over most of our screen time. Even tablets are being designed to replace laptops. Even as the ubiquitous bricks and slabs are getting more and more powerful each week, there’s always a need for a real computer. For most people, this typically means a laptop. \n \nEven the most digitally-forward folks will admit there’s no substitute for a keyboard and a big screen. Tasks like creating spreadsheets or presentations and editing photos or videos are far more easily accomplished on a laptop than on a tablet or mobile phone. But what laptop is right for you depends on a variety of factors: what exactly you plan on using it for, how often you intend to use it, and (most importantly) your budget.",
              style:  Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                "THE T3CHNICIAN ADVANTAGE",
                textAlign: TextAlign.center,
                 style:Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 20,
                  color:  AppColors.secondary,
                  fontWeight: FontWeight.bold
                 )
              ),
            ),
            SizedBox(height: 20,),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              crossAxisAlignment:WrapCrossAlignment.center,
              runAlignment: WrapAlignment.spaceAround,
              children: [     
                  AboutCard(title: "1 DAY SERVICE POLICY", img: "assets/svgs/intro1.svg",desc: "Time is precious, and we value yours! With our 1-Day Service Policy, your requests are completed within a day—guaranteed. Enjoy unmatched speed and efficiency like never before!",index: 1,),
                  AboutCard(title: "24/7 Support", img: "assets/svgs/intro2.svg",desc: "We’re here for you 24/7! Our dedicated Support Team is always ready to assist—anytime, anywhere. Get your queries resolved instantly and enjoy seamless service round the clock.",index: 2,),
                  AboutCard(title: "Buy and Sell Services", img: "assets/svgs/intro3.svg",desc: "Connect. Trade. Succeed. Buy top-notch services or sell your expertise effortlessly. Our platform ensures a seamless, secure, and user-friendly experience. Start now to grow!",index: 1,),

              ],
            ),
          ],
        ),
      ),
    );
  }
}