import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/pages/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    moveToLogin();
    super.initState();
  }

  moveToLogin() async {
    await Future.delayed(const Duration(seconds: 4), () async {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: primaryColor),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/logo.png",
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
