// ignore_for_file: avoid_print

import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class OptionField extends StatefulWidget {
  const OptionField(
      {super.key,
      required this.title,
      required this.options,
      required this.onChanged});
  final String title;
  final List<Map<String, dynamic>> options;
  final void Function(String) onChanged;

  @override
  State<OptionField> createState() => _OptionFieldState();
}

class _OptionFieldState extends State<OptionField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: fontStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: greyColor, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: SelectFormField(
              initialValue: widget.options[0]['value'],
              style: fontStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500),
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              items: widget.options,
              onChanged: (val) => widget.onChanged.call(val),
              onSaved: (val) => print(val),
            ),
          )
        ],
      ),
    );
  }
}
