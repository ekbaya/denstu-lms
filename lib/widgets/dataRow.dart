import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:flutter/material.dart';

class DataRowField extends StatelessWidget {
  final String title;
  final String value;
  const DataRowField({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: getWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: fontStyle(
                fontSize: 14,
                color: greyTextColor,
                fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: fontStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
