import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:dentsu_lms/models/piedata.dart';
import 'package:dentsu_lms/utilities/functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// ignore: must_be_immutable
class Requests extends StatelessWidget {
  Requests({super.key});

  List<charts.Series<PieData, String>> series = [
    charts.Series(
      id: 'Segments',
      data: [
        PieData('Insurance', 30),
        PieData('Credit', 40),
        PieData('Account', 30),
      ],
      domainFn: (PieData data, _) => data.category,
      measureFn: (PieData data, _) => data.value,
      colorFn: (PieData data, _) =>
          charts.ColorUtil.fromDartColor(getColor(data.category)),
      labelAccessorFn: (PieData data, _) => '${data.category}: ${data.value}%',
    )
  ];

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Requests",
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
          ),
          //pie chart
          SizedBox(
            height: 200,
            width: 200,
            child: charts.PieChart(series, animate: true),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 8,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Account",
                    style: fontStyle(fontSize: 12),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: blueColor,
                    radius: 8,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Credit",
                    style: fontStyle(fontSize: 12),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: greenColor,
                    radius: 8,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Insurance",
                    style: fontStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
