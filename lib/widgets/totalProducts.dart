import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TotalProducts extends StatelessWidget {
  const TotalProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Products",
                  style: h2Style(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_horiz),
                  onSelected: (String value) {
                    if (kDebugMode) {
                      print('Selected: $value');
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Every large design company whether it’s a multi-national branding.",
              style: hintStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mortgage",
                      style: fontStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "65,376",
                      style: fontStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              LinearPercentIndicator(
                lineHeight: 7.0,
                percent: 0.8,
                backgroundColor: primaryColor.withOpacity(0.1),
                progressColor: primaryColor,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "One Xtra Account",
                      style: fontStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "12,109",
                      style: fontStyle(
                          fontSize: 14,
                          color: deepBlueColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              LinearPercentIndicator(
                lineHeight: 7.0,
                percent: 0.8,
                backgroundColor: deepBlueColor.withOpacity(0.1),
                progressColor: deepBlueColor,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Motor Insurance",
                      style: fontStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "132,645",
                      style: fontStyle(
                          fontSize: 14,
                          color: greenShadeColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              LinearPercentIndicator(
                lineHeight: 7.0,
                percent: 0.8,
                backgroundColor: greenShadeColor.withOpacity(0.1),
                progressColor: greenShadeColor,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Credit Cards",
                      style: fontStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "65,376",
                      style: fontStyle(
                          fontSize: 14,
                          color: creditCardsColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              LinearPercentIndicator(
                lineHeight: 7.0,
                percent: 0.8,
                backgroundColor: creditCardsColor.withOpacity(0.1),
                progressColor: creditCardsColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
