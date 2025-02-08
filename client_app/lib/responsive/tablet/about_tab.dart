
import 'package:client_app/pages/about.dart';
import 'package:client_app/pages/cartpage.dart';
import 'package:client_app/pages/enquiry.dart';
import 'package:client_app/pages/profilePage.dart';
import 'package:client_app/responsive/tablet/topnav.dart';
import 'package:flutter/material.dart';

class AboutTab extends StatefulWidget {

   AboutTab({super.key});

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  final navigationPages= [About(),EnquiryPage(),CartPage(),ProfilePage()];
  int currentInd =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(flex: 6,),
            GestureDetector(
              onTap: (){
                setState(() {
                  currentInd=0;
                });
              },
              child: TopNav(name: "Home", active: currentInd==0?true:false)),
            Spacer(flex: 1,),
            GestureDetector(
              onTap: (){
                setState(() {
                  currentInd=1;
                });
              },
              child: TopNav(name: "Enquiry",active: currentInd==1?true:false)),
            Spacer(flex: 1,),
            GestureDetector(
              onTap: (){
                setState(() {
                  currentInd=2;
                });
              },
              child: TopNav(name: "Cart",active: currentInd==2?true:false)),
            Spacer(flex: 1,),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentInd= 3;
                });
              },
              child: TopNav(name: "Profile",active: currentInd==3?true:false)),
            Spacer(flex: 2,)
          ],
        ),
      ),
      body: navigationPages[currentInd],
     
    );
  }
}




      // // appBar: AppBar(
      // //   actions: [
      // //     GestureDetector(
      // //       child:TextHover(
      // //         text: "Sell",
      // //          config: Config(
      // //           hoverColor: AppColors.secondary
      // //          )
      // //         )
      // //     ),
      // //   ],
      // //     ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 100,
      //         child: Row(
      //           children: [
      //             Expanded(
      //               child: TextHover(
      //                 text: "Sell", 
      //                 config: Config(
      //                   textColor: AppColors.textColor,
      //                   hoverColor: AppColors.secondary,
      //                   textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
      //                     fontSize: 20
      //                   )
      //                 )),
      //             )
      //           ],
      //           ),
      //       ),
      //         About(),
      //     ],
      //   ),
      // )