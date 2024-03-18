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

bool isEven(int number) {
  return number % 2 == 0;
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
