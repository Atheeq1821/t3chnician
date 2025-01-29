import 'package:client_app/assets.dart';
import 'package:client_app/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutCard extends StatelessWidget {
  final String title;
  final String img;
  final String desc;
  const AboutCard({super.key, required this.title , required this.img, required this.desc});

  @override
  Widget build(BuildContext context) {
    final containerWidth = (MediaQuery.of(context).size.width * 0.6667 - 25 * 2) / 3;
    return ClipRRect(borderRadius: BorderRadius.circular(20),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: ResponsiveLayout.isPhone(context)? double.infinity : containerWidth
                      ),
                      child: Container(
                        height: 400,
                        // width: 300,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2,color: Colors.white24)
                          
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style:Theme.of(context).textTheme.displaySmall?.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                           )
                                ),
                                SizedBox(height: 10,),
                                SizedBox(
                                  height: 200,
                                  width: 200,
                                  child:SvgPicture.asset(
                                    img,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topLeft,
                                    )
                                    ),
                                    SizedBox(height: 20,),
                                Text(
                                desc,
                                textAlign: TextAlign.justify,
                                style:Theme.of(context).textTheme.displaySmall?.copyWith(
                                fontSize: 15,
                                color: AppColors.textColor,
                           )
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
    );
  }
}