import 'package:client_app/assets.dart';
import 'package:client_app/components/form_loader.dart';
import 'package:client_app/controllers/query.dart';
import 'package:client_app/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
class EnquiryPage extends StatelessWidget {
  const EnquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currW =ResponsiveLayout.isLaptop(context)? 600
    :
    MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(-1, -1), // Shadow position
                              blurRadius: 2, // Shadow blur
                              spreadRadius: 0.1,
                            )
                  ],
                  gradient: AppColors.diagonalGradient,

                  borderRadius: BorderRadius.circular(8)
            
                ),
                child: Text("Enquiry & Request",  
                textAlign: TextAlign.center,//child 1
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.textColor,
                  fontSize: currW *0.05
                ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text("Enquiry for Laptops or Spares",  //child 1
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppColors.secondary,
              fontSize: currW *0.05
            ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width:currW*0.3,
              child: Image.asset('assets/images/query.png', fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            Column(                                   // child 2
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("   • Click the button Enquiry below.",
                style: TextStyle(
                  fontSize: currW *0.035
                ),
                ),
                Text("   • Fill out the form with legit information.",
                style: TextStyle(
                  fontSize: currW *0.035
                ),
                ),
                Text("   • Within 24 hours our team will contact you.",
                style: TextStyle(
                  fontSize: currW *0.035
                ),
                ),
                Text("   • Attach relevant images if necessary.",
                style: TextStyle(
                  fontSize: currW *0.035
                ),
                ),
                SizedBox(height: 10,),
                TextButton(
                  onPressed: (){
                    Navigator.push(context
                        , MaterialPageRoute(
                            builder: (context) => QFormLoader(formUrl:"https://forms.gle/7hFxXajyrnnVy8117"))
                        );
                  },
                 child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.textColor,
                              
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                            child: Text("Enquiry ",
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: AppColors.primary,
                              fontSize: 20,
                            ),),
                          )
                 ),       
              ],
            ),
            SizedBox(height: 15,),
            Text("Service Request",                          // child 3
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppColors.secondary,
              fontSize: currW *0.05,
            ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width:currW*0.3,
              child: Image.asset('assets/images/servicereq.png', fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            Column(                                            // child 4
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                      Text("   • Click the button to contact via WhatsApp or Email.",
                      style: TextStyle(
                        fontSize: currW *0.035
                      ),
                      ),
                      Text("   • Provide clear details about the issue when messaging.",
                      style: TextStyle(
                        fontSize: currW *0.035
                      ),
                      ),
                      Text("   • Mention the device brand, model, and issue.",
                      style: TextStyle(
                        fontSize: currW *0.035
                      ),
                      ),
                      Text("   • Attach relevant images if necessary.",
                      style: TextStyle(
                        fontSize: currW *0.035
                      ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          TextButton(
                            onPressed: (){
                              contactWhatsapp("Hey I want service");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                              child: Text("Whatsapp ",
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                    color: AppColors.textColor,
                                    fontSize: 20,
                                ),
                              ),
                            )
                          ), 
                          TextButton(
                            onPressed: (){
                              contactMail("Hey I want service");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.textColor,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                              child: Text("Email ",
                                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                    color: AppColors.primary,
                                    fontSize: 20,
                                ),
                              ),
                            )
                          ),
                        ],
                      )
              ],
        
            ) ,
            SizedBox(height: 15,),
            Text("Sell you laptops",  //child 3
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppColors.secondary,
              fontSize: currW *0.05,
            ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width:currW*0.3,
              child: Image.asset('assets/images/selllaptop.png', fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            Column(                                   // child 4
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("   • Click the button below.",
                  style: TextStyle(
                          fontSize: currW *0.035
                  ),
                ),
                Text("   • Fill out the form with legit information.",
                style: TextStyle(
                          fontSize: currW *0.035
                  ),
                ),
                Text("   • Within 24 hours our team will contact you.",
                style: TextStyle(
                          fontSize: currW *0.035
                  ),
                ),
                Text("   • Attach relevant images if necessary.",
                style: TextStyle(
                          fontSize: currW *0.035 
                  ),
                ),
                SizedBox(height: 10,),
                TextButton(
                  onPressed: (){
                    Navigator.push(context
                        , MaterialPageRoute(
                            builder: (context) => QFormLoader(formUrl:"https://forms.gle/7hFxXajyrnnVy8117"))
                        );
                  },
                 child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.textColor,
                              
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                            child: Text("Sell",
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: AppColors.primary,
                              fontSize: 20,
                            ),),
                          )
                 ),       
              ],
            ),
          ],
        ),
      ),
    );
  }
}