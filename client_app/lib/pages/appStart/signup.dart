
import 'package:client_app/assets.dart';
import 'package:client_app/controllers/auth_service.dart';
import 'package:client_app/pages/appStart/login.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: Column(
                  children: [
                    Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 24,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Create a new account and get started",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: const Color.fromARGB(150, 53, 63, 84),
                        fontSize: 16,
                        fontWeight: FontWeight.w900
                      )),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      child: TextFormField(
                        validator: (value) => value!.isEmpty ? "Name cannot be empty." : null,
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Name"),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      child: TextFormField(
                        validator: (value) => value!.isEmpty ? "Email cannot be empty." : null,
                         controller: _emailController,
                         decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Email"),
                         ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      child: TextFormField(
                        validator: (value) => value!.isEmpty ? "Phone number cannot be empty" : null,
                         controller: _phone,
                         decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Phone number"),
                         ),
                      ),
                    )
                  ],),
              ),
              SizedBox(height: 10,),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    validator: (value) => value!.length < 8
                        ? "Password should have atleast 8 characters."
                        : null,
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Password"),
                    ),
                  )),
              SizedBox(height: 10,),
              SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * .9,
                  child: ElevatedButton(
                    
                    
                      onPressed: () {
                         if (formKey.currentState!.validate()) {
                          AuthService()
                              .createAccountWithEmail(
                                _nameController.text,
                                  _emailController.text, _passwordController.text,_phone.text)
                              .then((value) {
                            if (value == "Account Created") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Account Created")));
                              // Navigator.restorablePushNamedAndRemoveUntil(context, "/home" , (route) => false);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red.shade400,
                              ));
                            }
                          });
                        }
                      },
                        style:  ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        foregroundColor: AppColors.primary
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 16),
                      ))),
                
            SizedBox(height: 10,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have and account?"),
                  TextButton(
                      onPressed: () {
                        updateColumnContent('logincontrol',LoginPage());
                      },
                      child: Text("Login",style: TextStyle(color: AppColors.primary),))
                ],
              ),
              Spacer(flex: 3,)
            ]
          ),
        )
      ),
    );
  }
}