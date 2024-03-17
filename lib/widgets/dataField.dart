import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:flutter/material.dart';

class DataField extends StatelessWidget {
  final String title;
  final String value;
  const DataField({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: greyColor, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: fontStyle(
                fontSize: 14, color: greyColor, fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: fontStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
