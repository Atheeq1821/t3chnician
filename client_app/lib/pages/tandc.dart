import 'package:client_app/assets.dart';
import 'package:flutter/material.dart';

class TermandConditions extends StatelessWidget {
  const TermandConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Terms & Conditions", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
                  _buildSubSection("1. Introduction", "Welcome to T3chnicians (\"we,\" \"our,\" \"us\"). These Terms and Conditions govern your use of our platform."),
                  _buildSubSection("2. User Accounts", "Users must create an account and maintain confidentiality of login credentials."),
                  _buildSubSection("3. Buying and Selling", "Users can request purchases and list laptops for sale. Transactions are completed only after mutual satisfaction."),
                  _buildSubSection("4. Service Requests", "Servicing takes 1-2 days. Unclaimed products beyond 90 days will be scrapped."),
                  _buildSubSection("5. Payment and Refunds", "Payments are securely processed and done via UPI or COD."),
                  _buildSubSection("6. Warranty and Liability", "Limited warranty may apply to spare parts and serviced products."),
                  _buildSubSection("7. Prohibited Activities", "Fraudulent sales, false claims, and misuse of platform are not allowed."),
                  _buildSubSection("8. Dispute Resolution", "Disputes should be resolved between parties. If unresolved, we will mediate."),
                  _buildSubSection("9. Changes to Terms", "We reserve the right to modify these Terms at any time."),
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