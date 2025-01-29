import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _buildPage(
            title: "Welcome!",
            description: "This is the first onboarding page.",
            image: Icons.star,
            context: context,
          ),
          _buildPage(
            title: "Stay Organized",
            description: "This is the second onboarding page.",
            image: Icons.calendar_today,
            context: context,
          ),
          _buildPage(
            title: "Get Started",
            description: "This is the third onboarding page.",
            image: Icons.check_circle,
            context: context,
            isLastPage: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String description,
    required IconData image,
    required BuildContext context,
    bool isLastPage = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(image, size: 100, color: Colors.blue),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        if (isLastPage)
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
              onPressed: () async {
                // Mark onboarding as complete
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('onboarding_complete', true);

                // Navigate to home screen
                print("athome");
              },
              child: Text("Get Started"),
            ),
          ),
      ],
    );
  }
}
