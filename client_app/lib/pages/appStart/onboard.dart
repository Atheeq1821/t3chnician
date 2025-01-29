import 'dart:ui';

import 'package:client_app/pages/appStart/authentication.dart';
import 'package:client_app/pages/appStart/intro_1.dart';
import 'package:client_app/pages/appStart/intro_2.dart';
import 'package:client_app/pages/appStart/intro_3.dart';
import 'package:client_app/pages/appStart/start.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide Image;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {

  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/riveAssets/Spline.png"),
            ),
            Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,sigmaY: 10
              ),
              )
            ),
          RiveAnimation.asset("assets/riveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 30,sigmaY: 30
              ),
              child: SizedBox(),
              )
            ),
            SafeArea(
              child: Stack(
                children: [PageView(
                  controller: _controller,
                  onPageChanged: (index){
                    setState(() {
                      onLastPage = (index == 3);
                    });
                  },
                  children: [
                    Start(),
                    Introduction1(),
                    Introduction2(),
                    Introduction3()
                  ],
                ),
                Container(
                  alignment: Alignment(0,0.75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          _controller.jumpToPage(3);
                        },
                        child: Text("Skip",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 18
                        )
                        ,),
                      ),
                      SmoothPageIndicator(controller: _controller, count: 4),
                      onLastPage?
                      GestureDetector(
                        onTap: (){
                          showGeneralDialog(
                            context: context, pageBuilder: (context , _,__) => Center(
                            child: Container(
                              height: 620,
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(40))
                              ),
                              child: LoginAuthentication(),
                            ),
                          ),);
                        },
                        child: Text("Get Started",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 18
                        )
                        ),
                      ):
                      GestureDetector(
                        onTap: (){
                          _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInCirc);
                        },
                        child: Text("Next",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 18
                        )
                        ),
                      )
                      
                    ],
                  ))
                
                ]
              )
              )     
        ],
      ),
    );
  }
}