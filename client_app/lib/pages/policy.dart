import 'package:client_app/assets.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const  PrivacyPolicy({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Privacy Policy", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
              }, 
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: AppColors.selectedGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.arrow_back,color:AppColors.primary ))
            ),
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        elevation: 0, 
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [ 
              
              SizedBox(height: 20,),
              _buildSubSection("1. Introduction", "This Privacy Policy explains how we collect, use, and protect your information."),
                _buildSubSection("2. Information We Collect", "Personal details, transaction history, device & usage data."),
                _buildSubSection("3. How We Use Your Information", "For transactions, support, security, and improving our platform."),
                _buildSubSection("4. Data Sharing", "We do not sell data but may share with payment processors and logistics partners."),
                _buildSubSection("5. Data Security", "We implement strong security measures to protect user data."),
                _buildSubSection("6. Your Rights", "Users can access, modify, or delete account information."),
                _buildSubSection("7. Cookies and Tracking", "Cookies enhance user experience; settings can be managed."),
                _buildSubSection("8. Changes to Privacy Policy", "We may update this Privacy Policy and notify users of changes."),
                _buildSubSection("9. Contact Us", "For queries, contact us at [support@email.com]."),
            ],
          ),
        )
      ),
    );
  }

  Widget _buildSubSection(String title, String content) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold , color: AppColors.secondary)),
          SizedBox(height: 5),
          Text(content, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}