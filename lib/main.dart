import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/controllers/auth.dart';
import 'package:dentsu_lms/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AccountController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dentsu LMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.dmSans(),
          titleLarge: GoogleFonts.dmSans(),
          bodyMedium: GoogleFonts.dmSans(),
        ),
      ),
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
