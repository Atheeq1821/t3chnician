import 'package:client_app/assets.dart';
import 'package:client_app/controllers/auth_service.dart';
import 'package:client_app/pages/update_profile.dart';
import 'package:client_app/providers/cart_provider.dart';
import 'package:client_app/providers/user_provider.dart';
import 'package:client_app/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0), // Add padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
          children: [
            Text(
              " Profile",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            Consumer<UserProvider>(
              builder: (context, value, child) => Card(
                color: AppColors.secondary,
                child: ListTile(

                  title: Text(value.name,style: TextStyle(fontSize: 18),),
                  subtitle: Text(value.email),
                  onTap: () {
                    Navigator.push(context
                        , MaterialPageRoute(
                            builder: (context) =>UpdateProfile())
                        );
                    // Navigator.pushNamed(context, "/update_profile");
                  },
                  trailing: Icon(Icons.edit_outlined),
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text("Orders",style: TextStyle(fontSize: 20,color: AppColors.textColor),),
              leading: Icon(Icons.local_shipping,color: AppColors.secondary,),
              onTap: () {
                Navigator.pushNamed(context, "/orders");
              },
            ),
            // Divider(thickness: 1, endIndent: 10, indent: 10),
            // ListTile(
            //   title: Text("Discount & Offers",style: TextStyle(fontSize: 20,color: AppColors.textColor),),
            //   leading: Icon(Icons.discount_rounded,color: AppColors.secondary,),
            //   onTap: () {
            //     Navigator.pushNamed(context, "/discount");
            //   },
            // ),
            Divider(thickness: 1, endIndent: 10, indent: 10),
            ListTile(
              title: Text("Term & Conditions",style: TextStyle(fontSize: 20,color: AppColors.textColor),),
              leading: Icon(Icons.description_rounded,color: AppColors.secondary,),
              onTap: () {
                Navigator.pushNamed(context,"/terms&conditions");
                // if(ResponsiveLayout.isPhone(context)){
                //   Navigator.pushNamed(context,"/terms&conditions");
                // }
                // else{

                // }
              },
            ),
            Divider(thickness: 1, endIndent: 10, indent: 10),
            ListTile(
              title: Text("Privacy policy",style: TextStyle(fontSize: 20,color: AppColors.textColor),),
              leading: Icon(Icons.privacy_tip_rounded,color: AppColors.secondary,),
              onTap: () {
                Navigator.pushNamed(context,"/privacypolicy");
                // if(ResponsiveLayout.isPhone(context)){
                //   Navigator.pushNamed(context,"/terms&conditions");
                // }
                // else{

                // }
              },
            ),
            Divider(thickness: 1, endIndent: 10, indent: 10),
            ListTile(
              title: Text("Logout",style: TextStyle(fontSize: 20,color: AppColors.textColor),),
              leading: Icon(Icons.logout,color: AppColors.secondary,),
              onTap: () async {
                Provider.of<UserProvider>(context, listen: false).cancelProvider();
                Provider.of<CartProvider>(context, listen: false).cancelProvider();
                await AuthService().logout();
                Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => true);
              },
            ),
          ],
        ),
    );

  }
}