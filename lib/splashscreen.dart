import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trustforge/features/authentication/screens/onboarding/onboarding.dart';
import 'package:trustforge/features/wallet/screens/login/login.dart';
import 'package:trustforge/navigationmenu.dart';
import 'package:trustforge/utils/constants/colors.dart';
import 'package:trustforge/utils/constants/images_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Future.delayed(const Duration(seconds: 5), () {
      if (token != null) {
        // Navigate to NavigationMenu if the token exists
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NavigationMenu()),
        );
      } else {
        // Navigate to OnBoardingScreen if no token exists
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.primaryColor,
      body: Center(
        child: Image.asset(MImage.lightAppLogo),
      ),
    );
  }
}
