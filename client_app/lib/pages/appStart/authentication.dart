import 'package:client_app/assets.dart';
import 'package:flutter/material.dart';

class LoginAuthentication extends StatefulWidget {
  const LoginAuthentication({super.key});

  @override
  State<LoginAuthentication> createState() => _LoginAuthenticationState();
}

class _LoginAuthenticationState extends State<LoginAuthentication> {
  bool isSignup =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      backgroundColor: Colors.transparent,
      body: ValueListenableBuilder<Map<String, Widget?>>(
        valueListenable: columnContentNotifier,
        builder: (context, value, child){
          return value['logincontrol']?? SizedBox.shrink();
        }
      ),
    );
  }
}