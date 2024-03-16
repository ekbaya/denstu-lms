import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:dentsu_lms/pages/home.dart';
import 'package:dentsu_lms/widgets/button.dart';
import 'package:dentsu_lms/widgets/checkbox.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome to Dentsu LMS",
              style: h1Style(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "A tool that leverage's the power of data and artificial intelligence to drive digital transformation at scale",
              textAlign: TextAlign.center,
              style: fontStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 40,
            ),
            InputField(label: "Username", hint: "Enter your email or Username"),
            const SizedBox(
              height: 20,
            ),
            InputField(label: "Password", hint: "Enter your Password"),
            Row(
              children: [
                CustomCheckbox(
                  value: checkedValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkedValue = value ?? false;
                    });
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Keep me logged in",
                  style: fontStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              title: "Log In",
              onClick: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    (route) => false);
              },
              backgroundColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
