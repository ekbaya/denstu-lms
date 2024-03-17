import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:flutter/material.dart';

class CustomDataField extends StatelessWidget {
  const CustomDataField(
      {super.key,
      required this.name,
      required this.value,
      this.onEdit,
      required this.editable,
      this.leading,
      this.onTap});
  final String name;
  final String value;
  final Widget? leading;
  final bool editable;
  final void Function()? onEdit;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: fontStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () => onTap!.call(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: greyColor, width: 1),
              ),
              child: ListTile(
                horizontalTitleGap: 10,
                leading: leading,
                title: Text(
                  value,
                  style: fontStyle(
                      fontSize: 13,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500),
                ),
                trailing: editable
                    ? TextButton(
                        onPressed: () => onEdit!.call(),
                        child: Text(
                          "Edit",
                          style: fontStyle(
                              color: blueColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
