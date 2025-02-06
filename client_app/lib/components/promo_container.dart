import 'package:carousel_slider/carousel_slider.dart';
import 'package:client_app/controllers/db_service.dart';
import 'package:client_app/model/promo_banners_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:ui'; // Make sure to import this for ImageFilter

class PromoContainer extends StatefulWidget {
  const PromoContainer({super.key});

  @override
  State<PromoContainer> createState() => _PromoContainerState();
}

class _PromoContainerState extends State<PromoContainer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DbService().readPromos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PromoBannersModel> promos = PromoBannersModel.fromJsonList(snapshot.data!.docs) as List<PromoBannersModel>;
          if (promos.isEmpty) {
            return SizedBox();
          } else {
            return CarouselSlider(
              items: promos.map((promo) => GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(
                  //   context, "/specific", arguments: {
                  //   "category": promo.category,
                  // },
                  // );
                },
                child: SizedBox(
                  height: 190,
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Image.network(
                          promo.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              )).toList(),
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                aspectRatio: 16 / 8,
                viewportFraction: 1,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            );
          }
        } else {
          return Shimmer(
            child: Container(
              height: 300,
              width: double.infinity,
            ),
            gradient: LinearGradient(colors: [Colors.grey.shade200, Colors.white]),
          );
        }
      },
    );
  }
}



// SizedBox(
//                   height: 190,
//                   width: double.infinity,
//                   child: Card(
//                     elevation: 10,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)
//                     ),
                    
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: BackdropFilter(
//                         filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10)
//                         )
//                         ),
//                   ),
//                 ),