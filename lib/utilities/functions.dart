import 'package:dentsu_lms/constants/colors.dart';
import 'package:flutter/material.dart';

Color getColor(String category) {
  switch (category) {
    case 'Account':
      return primaryColor;
    case 'Credit':
      return blueColor;
    case 'Insurance':
      return greenColor;
    default:
      return Colors.grey;
  }
}
