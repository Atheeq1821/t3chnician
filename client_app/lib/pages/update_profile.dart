import 'package:client_app/assets.dart';
import 'package:client_app/controllers/db_service.dart';
import 'package:client_app/pages/profilePage.dart';
import 'package:client_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  // TextEditingController _addressController = TextEditingController();
  TextEditingController _MobilenumberController = TextEditingController();

  @override
  void initState() {
    final user=Provider.of<UserProvider>(context,listen: false);
    _nameController.text = user.name;
    _emailController.text = user.email;
    // _addressController.text = user.address;
    _MobilenumberController.text = user.Mobilenumber;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text(
          "T3chnician",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.secondary),
        ),
        scrolledUnderElevation: 0,
        forceMaterialTransparency: true,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          ),
          icon: Icon(Icons.arrow_back, color: AppColors.secondary),
        ),
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Form(
            key:  formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " Update Profile",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 17,),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Name",
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: AppColors.secondary),
                        hintStyle: TextStyle(color: AppColors.textColor),
                    ),
                    style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.bold),
                    validator: (value) =>
                        value!.isEmpty ? "Name cannot be empty." : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Email",
                        border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: AppColors.secondary),
                      hintStyle: TextStyle(color: AppColors.textColor),
                    ),
                    style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.bold),
                    validator: (value) =>
                        value!.isEmpty ? "Name cannot be empty." : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // TextFormField(
                  //   maxLines: 3,
                  //   controller: _addressController,
                  //   decoration: InputDecoration(
                  //       labelText: "Address",
                  //       hintText: "Address",
                  //       border: OutlineInputBorder()),
                  //   validator: (value) =>
                  //       value!.isEmpty ? "Address cannot be empty." : null,
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _MobilenumberController,
                    decoration: InputDecoration(
                        labelText: "Phone",
                        hintText: "Phone",
                        border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: AppColors.secondary),
                      hintStyle: TextStyle(color: AppColors.textColor),
                    ),
                    style: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.bold),
                    validator: (value) =>
                        value!.isEmpty ? "Phone cannot be empty." : null,
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .9,
                    child: Center(  // Center widget wraps the ElevatedButton
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            var data = {
                              "name": _nameController.text,
                              "email": _emailController.text,
                              // "address":_addressController.text,
                              "Mobilenumber": _MobilenumberController.text
                            };
                            await DbService().updateUserData(extraData: data);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile Updated")));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary,
                            foregroundColor: Colors.white
                        ),
                        child: Text(
                          "Update Profile",
                          style: TextStyle(fontSize: 16,color: AppColors.gradientEnd),
                        ),
                      ),
                    ),
                  ),

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
