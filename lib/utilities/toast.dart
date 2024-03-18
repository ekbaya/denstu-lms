import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void showToastDialog(String message, BuildContext context, Color background) {
  ToastContext().init(context);
  Toast.show(message,
      duration: Toast.lengthLong,
      gravity: Toast.bottom,
      backgroundColor: background);
}
