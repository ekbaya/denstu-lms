import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TotalLeads extends StatelessWidget {
  const TotalLeads({
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Leads",
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
          CircularPercentIndicator(
            radius: 100.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 10.0,
            percent: 0.80,
            center: CircleAvatar(
              backgroundColor: primaryColor,
              radius: 45,
              child: Text(
                "80%",
                style: fontStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: circularBackground,
            progressColor: primaryColor,
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Contacted",
                        style: fontStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "1.7k",
                        style: fontStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: circularBackground,
                    radius: 8,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Total leads",
                        style: fontStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "2.73k",
                        style: fontStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
