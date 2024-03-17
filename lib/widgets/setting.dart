import 'package:dentsu_lms/constants/funtions.dart';
import 'package:flutter/material.dart';

import 'switch.dart';

class Setting extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;
  const Setting({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: fontStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              CustomSwitch(
                value: value,
                onChanged: (value) => onChanged.call(value),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
