import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String title;
  final Function() onClick;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton(
      {super.key,
      required this.title,
      required this.onClick,
      this.width,
      this.height,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: backgroundColor ?? primaryColor,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Center(
          child: Text(
            title,
            style: h1Style(
                color: textColor ?? Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
