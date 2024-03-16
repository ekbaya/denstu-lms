import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged?.call(!value);
      },
      child: value
          ? Image.asset(
              'assets/icons/checkbox.png',
              color: Colors.white,
            )
          : const Icon(Icons.check_box_outline_blank,
              size: 24.0, color: Colors.white),
    );
  }
}
