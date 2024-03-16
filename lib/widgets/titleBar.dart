import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageTitleBar extends StatelessWidget {
  final String title;
  final String buttonText;
  final Function onAddButtonClicked;
  const PageTitleBar({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onAddButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: fontStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: textColor),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => onAddButtonClicked.call(),
              child: Container(
                width: 150,
                height: 42,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        buttonText,
                        style: fontStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_horiz),
              onSelected: (String value) {
                if (kDebugMode) {
                  print('Selected: $value');
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'option1',
                  child: Text('Option 1'),
                ),
                const PopupMenuItem<String>(
                  value: 'option2',
                  child: Text('Option 2'),
                ),
                const PopupMenuItem<String>(
                  value: 'option3',
                  child: Text('Option 3'),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
