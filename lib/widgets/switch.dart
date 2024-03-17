import 'package:dentsu_lms/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (value) => onChanged.call(value),
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: inActiveTrackColor.withOpacity(0.6),
    );
  }
}
