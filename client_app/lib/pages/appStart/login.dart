import 'package:rive/rive.dart';
import 'package:client_app/assets.dart';
import 'package:client_app/controllers/auth_service.dart';
import 'package:client_app/pages/appStart/signup.dart';
import 'package:client_app/responsive/widget_tree.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  late SMITrigger check ;
  late SMITrigger reset ;
  late SMITrigger error ;

  StateMachineController getRiveController(Artboard artboard){
    StateMachineController? controller = 
      StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Spacer(),
                  SizedBox(
                    child: Column(
                      children: [
                        Text("Login",
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 24,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w900
                        ),),
                        SizedBox(height: 10,),
                        Text("Get started with your account",
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: const Color.fromARGB(150, 53, 63, 84),
                          fontSize: 16,
                          fontWeight: FontWeight.w900
                        )),
                        SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .9,
                          child: TextFormField(
                            validator: (value) =>
                              value!.isEmpty ? "Email cannot be empty." : null,
                              controller: _emailController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.secondary, width: 2.0),
                                ),
                                border: OutlineInputBorder(
                                  
                                ),
                                label: Text("Email"),
                                floatingLabelStyle: TextStyle(color: AppColors.secondary)
                              ),
                            
                          ),
                          ),
                           SizedBox(height: 20,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .9,
                            child: TextFormField(
                                  validator: (value) => value!.length < 8
                                      ? "Password should have atleast 8 characters."
                                      : null,
                                  controller: _passController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.secondary, width: 2.0),
                                    ),
                                    label: Text("Password"),
                                    floatingLabelStyle: TextStyle(color: AppColors.secondary)
                                  ),
                                )
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  showDialog(context: context, builder: (builder){
                                    return AlertDialog(
                                      title:  Text("Forget Password",
                                      ),
                                      titleTextStyle: TextStyle(
                                        color: AppColors.secondary
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Enter you email"),
                                          SizedBox(height: 10,),
                                          TextFormField (controller:  _emailController, decoration: InputDecoration(label: Text("Email"), border: OutlineInputBorder()),),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(onPressed: (){
                                            Navigator.pop(context);}, child: Text("Cancel")),
                                        TextButton(onPressed: () async{
                                          if(_emailController.text.isEmpty){
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email cannot be empty")));
                                            return;
                                          }
                                          await AuthService().resetPassword(_emailController.text).then((value) {
                                            if(value=="Mail Sent"){
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password reset link sent to your email")));
                                              Navigator.pop(context);
                                            }
                                            else{
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value,style: TextStyle( color:  Colors.white),), backgroundColor: Colors.red.shade400,));
                                            }
                                          });
                                        }, child: Text("Submit"))
                                      ],
                                    );
                                  });
                                }, 
                                child: Text("Forget Password",style: TextStyle(color: AppColors.secondary),)
                                )
                            ],
                            ),
                            SizedBox(height: 20,),
                            SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width * .9,
                              child: ElevatedButton(
                                onPressed: (){
                                    setState(() {
                                              isShowLoading =true;
                                      });
                                  Future.delayed(
                                    Duration(seconds:1),(){
                                  if (formKey.currentState!.validate()){
                                    FocusScope.of(context).unfocus();
                                    AuthService()
                                    .loginWithEmail("syed@gmail.com", "@Super123")
                                    .then((value){
                                      if (value == "Login Successful"){
                                        check.fire();
                                        Future.delayed(
                                          Duration(seconds:2),(){
                                            Navigator.restorablePushNamedAndRemoveUntil(context, "/home" , (route) => false);
          
                                        ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Login Successful")));
                                          }
                                        );
                                      }
                                      else{
                                        error.fire();
                                        Future.delayed(
                                              Duration(seconds: 2),(){
                                                setState(() {
                                                  isShowLoading=false;
                                                });
                                              }
                                          );
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
                                });
                                }, 
                                style:  ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.secondary,
                                      foregroundColor: AppColors.primary
                                ),
                                child: Text("Login",
                                style: TextStyle(fontSize: 16)
                                )
                                ),
                            ), 
                            SizedBox(height: 10,),
                          ],
                        ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            updateColumnContent('logincontrol',SignupPage());
                          },
                          child: Text("Sign Up",style: TextStyle(color: AppColors.secondary),))
                    ],
                  ),
                  Spacer(flex: 2,),
                ],
              ),
            )
            ),
            isShowLoading? CustomPositioned(rivChild: RiveAnimation.asset(
                      "assets/riveAssets/check.riv",
                      onInit: (artboard){
                        StateMachineController controller = getRiveController(artboard);
                        check = controller.findSMI("Check") as SMITrigger;
                        error = controller.findSMI("Error") as SMITrigger;
                        reset = controller.findSMI("Reset") as SMITrigger;
                      },
                      ), 
              size: 100)
            :
              SizedBox()
        ],
      ),
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.rivChild, required this.size});
  final Widget rivChild;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
              child: Column(
                children: [
                  Spacer(),
                  SizedBox(
                    height:size,
                    width: size,
                    child: rivChild,
                  ),
                  Spacer(flex: 2,),
                ],
              )
              );
  }
}