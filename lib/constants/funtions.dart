import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

TextStyle hintStyle({double? fontSize, FontWeight? fontWeight, Color? color}) {
  return GoogleFonts.dmSans(
      fontSize: fontSize ?? 11,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? const Color(0xff3F4347));
}

TextStyle fontStyle({double? fontSize, FontWeight? fontWeight, Color? color}) {
  return GoogleFonts.dmSans(
      fontSize: fontSize ?? 13,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? const Color(0xff667085));
}

TextStyle h1Style({double? fontSize, FontWeight? fontWeight, Color? color}) {
  return GoogleFonts.dmSans(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? Colors.black);
}

TextStyle h2Style({double? fontSize, FontWeight? fontWeight, Color? color}) {
  return GoogleFonts.dmSans(
      fontSize: fontSize ?? 11,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? const Color(0xff101828));
}

// ignore: must_be_immutable
class ModelSheet extends StatefulWidget {
  Widget child;
  ModelSheet({super.key, required this.child});

  @override
  State<ModelSheet> createState() => _ModelSheetState();
}

class _ModelSheetState extends State<ModelSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: getWidth(context) * 0.5,
            child: const Divider(
              color: Color(0xFFD0D5DD),
              height: 40,
              thickness: 3,
            ),
          ),
          Expanded(child: widget.child)
        ],
      ),
    );
  }
}

Widget searchField(
    {required TextEditingController controller,
    String? hintText,
    ValueChanged<String>? onType,
    VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      //height: 45,
      padding: const EdgeInsets.fromLTRB(12, 13, 12, 13),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor)),
      child: Row(
        children: [
          const Icon(CupertinoIcons.search),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              onTap: onTap,
              readOnly: onTap != null,
              onChanged: (value) {
                if (onType != null) {
                  onType(value);
                }
              },
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                hintText: hintText ?? "Search...",
                hintStyle: hintStyle(),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget PaginationWidget({
  required String text,
  String? nextButtonText,
  String? previousButtonText,
  required VoidCallback onNextClick,
  required VoidCallback onPreviousClick,
}) {
  return Row(
    children: [
      Text(
        text,
        style: fontStyle(),
      ),
      const Spacer(),
      InkWell(
        onTap: onPreviousClick,
        child: Container(
          alignment: Alignment.center,
          height: 47,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            "Previous",
            style: h2Style(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      const SizedBox(
        width: 14,
      ),
      InkWell(
        onTap: onNextClick,
        child: Container(
          alignment: Alignment.center,
          height: 47,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            "Next",
            style: h2Style(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ],
  );
}

Dialog popUpDialogue(BuildContext context,
    {required String title, Widget? child}) {
  return Dialog(
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: h1Style(),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 27,
                  width: 27,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(4.2)),
                  child: Icon(
                    CupertinoIcons.clear_circled,
                    color: redColor,
                    size: 16,
                  ),
                ),
              )
            ],
          ),
          child ?? const SizedBox()
        ],
      ),
    ),
  );
}
