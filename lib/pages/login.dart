import 'dart:convert';

import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:dentsu_lms/helpers/response.dart';
import 'package:dentsu_lms/models/session.dart';
import 'package:dentsu_lms/pages/home.dart';
import 'package:dentsu_lms/utilities/toast.dart';
import 'package:dentsu_lms/widgets/button.dart';
import 'package:dentsu_lms/widgets/checkbox.dart';
import 'package:dentsu_lms/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginCallBack {
  bool checkedValue = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  late LoginResponse loginResponse;
  _LoginPageState() {
    loginResponse = LoginResponse(this);
  }

  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    loadSecuredCredentials();
    super.initState();
  }

  loadSecuredCredentials() async {
    // Retrieve username
    String? username = await storage.read(key: 'username') ?? "";
    usernameController.text = username;
    // Retrieve password
    String? password = await storage.read(key: 'password') ?? "";
    passwordController.text = password;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Container(
          height: getHeight(context),
          width: getWidth(context),
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
              CustomTextField(
                controller: usernameController,
                title: "Username",
                hintText: "Enter username or email",
              ),
              CustomTextField(
                controller: passwordController,
                title: "Password",
                obscure: obscureText,
                hintText: "Enter password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                  if (usernameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    EasyLoading.show(status: 'please wait...');
                    loginResponse.doLogin(usernameController.text.trim(),
                        passwordController.text.trim());
                  } else {
                    showToastDialog(
                        "Please fill all details", context, Colors.red);
                  }
                },
                backgroundColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {
    EasyLoading.dismiss();
    showToastDialog("Failed. Some error occurred please try again later",
        context, Colors.red);
  }

  @override
  void onLoginFailure(String error) {
    EasyLoading.dismiss();
    showToastDialog(error, context, Colors.red);
  }

  @override
  Future<void> onSuccessLogin(Session session) async {
    EasyLoading.dismiss();
    showToastDialog("Login was successful.", context, Colors.green);
    // Save username
    await storage.write(key: 'username', value: usernameController.text.trim());
    // Save password
    await storage.write(key: 'password', value: passwordController.text.trim());
    String currentSession = json.encode(session);
    SharedPreferences prefes = await SharedPreferences.getInstance();
    prefes.setString("session", currentSession);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ),
        (route) => false);
  }
}
