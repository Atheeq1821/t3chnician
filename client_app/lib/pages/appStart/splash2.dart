
import 'package:client_app/pages/appStart/spalsh1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _checkOnboardingComplete(context);
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> _checkOnboardingComplete(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final isOnboardingComplete = prefs.getBool('onboarding_complete') ?? false;

    if (isOnboardingComplete) {
      print("at home normal");
    } else {
      Navigator.push(context
                        , MaterialPageRoute(
                            builder: (context) => OnboardingScreen())
                        );

    }
  }
}