import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:dentsu_lms/models/chartdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Leads extends StatelessWidget {
  const Leads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartData, int>> series = [
      charts.Series(
        id: 'Accounts',
        data: [
          ChartData(0, 0),
          ChartData(1, 150),
          ChartData(2, 200),
          ChartData(3, 180),
          ChartData(4, 220),
        ],
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(primaryColor),
        domainFn: (ChartData data, _) => data.month,
        measureFn: (ChartData data, _) => data.value,
      ),
      charts.Series(
        id: 'Insurance',
        data: [
          ChartData(0, 0),
          ChartData(1, 90),
          ChartData(2, 100),
          ChartData(3, 110),
          ChartData(4, 120),
        ],
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(greenColor),
        domainFn: (ChartData data, _) => data.month,
        measureFn: (ChartData data, _) => data.value,
      ),
      charts.Series(
        id: 'Credits',
        data: [
          ChartData(0, 0),
          ChartData(1, 130),
          ChartData(2, 140),
          ChartData(3, 135),
          ChartData(4, 150),
        ],
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(blueColor),
        domainFn: (ChartData data, _) => data.month,
        measureFn: (ChartData data, _) => data.value,
      ),
    ];

    return Container(
      width: 280.0,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Leads",
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
              SizedBox(
                height: 220,
                child: charts.LineChart(
                  series,
                  animate: true,
                  defaultRenderer:
                      charts.LineRendererConfig(includePoints: false),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
