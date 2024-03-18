import 'package:dentsu_lms/constants/funtions.dart';
import 'package:dentsu_lms/utilities/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.title,
      this.inputType,
      this.obscure,
      this.fontSize,
      this.onChanged,
      this.prefixIcon,
      this.inputFormatters,
      this.onSubmitted,
      this.hintText,
      this.suffixIcon});
  final TextEditingController controller;
  final String title;
  final TextInputType? inputType;
  final bool? obscure;
  final double? fontSize;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onSubmitted;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.isNotEmpty
              ? Text(
                  title,
                  style: fontStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                )
              : Container(),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: TextField(
              controller: controller,
              keyboardType: inputType ?? TextInputType.text,
              obscureText: obscure ?? false,
              style: hintStyle(fontSize: 16, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                hintText: hintText,
                hintStyle: hintStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              onChanged: (value) => onChanged!.call(value),
              inputFormatters: inputFormatters,
              onSubmitted: (value) => hideKeyboard(context),
              onEditingComplete: () => hideKeyboard(context),
            ),
          )
        ],
      ),
    );
  }
}
