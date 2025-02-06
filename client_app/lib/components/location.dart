import 'package:client_app/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MapScreen extends StatelessWidget {
  final String mapUrl = "https://maps.app.goo.gl/KEDEJqMN2ocg82rh6";
  final LatLng location = LatLng(13.0827, 80.2707);
  Future<void> _launchMap() async {
    Uri uri = Uri.parse(mapUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $mapUrl";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),

        Align(
          alignment: Alignment.centerLeft,
          child: Text("Our Location",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w900
          ),),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: _launchMap,
           child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            width: 500,
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/map.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
            ),
        ),
        SizedBox(height: 10,),
        
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Contact Us",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w900
          ),),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.phone,
              color: AppColors.textColor,),
            SizedBox(width: 8,),
            Text("+91 93423 31429")
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.mail_rounded,
              color: AppColors.textColor,),
            SizedBox(width: 8,),
            Text("t3chnician@gmail.com")
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.facebook,
              size: 30,
              color: AppColors.textColor,),
              SizedBox(width: 8,),
            SizedBox(
              height: 30,
              width: 30,
              child: SvgPicture.asset("assets/svgs/instagram.svg"),
            ),
            SizedBox(width: 8,),
            SizedBox(
              height: 30,
              width: 30,
              child: SvgPicture.asset("assets/svgs/youtube.svg"),
            ),
            // SizedBox(
            //   width: 50,
            //   height: 50,
            //   child: FlutterSocialButton(
            //     showLabel: false,
            //     onTap: () {},
            //     buttonType: ButtonType.facebook, // Button type for different type buttons
            //     ),
            // ),
            
          ],
        ),
        SizedBox(height: 25,),
        Align(alignment: Alignment.center,
        child: Text("©2025 T3chnician. All rights reserved"),)
      ],
    );
  }
}