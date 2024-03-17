import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:dentsu_lms/widgets/dataField.dart';
import 'package:dentsu_lms/widgets/dataRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LeadDetailsPage extends StatefulWidget {
  const LeadDetailsPage({super.key});

  @override
  State<LeadDetailsPage> createState() => _LeadDetailsPageState();
}

class _LeadDetailsPageState extends State<LeadDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        title: const Text(
          "Lead : LD-20210121-41760202",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: getWidth(context),
              height: 86,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lead Status",
                    style: fontStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Container(
                    width: 158,
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.5),
                      gradient: const LinearGradient(
                          colors: [Color(0xff5ABEA6), Color(0xff863AAC)]),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 15,
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Contacted",
                            style: fontStyle(fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 175,
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.close,
                          color: primaryColor,
                          size: 20,
                        ),
                        Text(
                          "Cancel lead",
                          style: fontStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: primaryColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 175,
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Next",
                          style: fontStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: getWidth(context),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://lh3.googleusercontent.com/a/ACg8ocKSjXfgQFUQltPAkgQFI1ARnXXpmJEzX4xk64CHbHTHyPtn=s288-c-no",
                        ),
                        radius: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Elias Baya",
                            style: fontStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Nairobi, Kenya",
                            style: fontStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                  const DataField(
                    title: "Lead Created",
                    value: "10 August 2022",
                  ),
                  const DataField(
                    title: "Last Contacted",
                    value: "16 August 2022",
                  ),
                  const DataField(
                    title: "Next Appointment",
                    value: "29 August 2022",
                  ),
                ],
              ),
            ),
            Container(
              width: getWidth(context),
              height: 420,
              padding: const EdgeInsets.only(top: 20),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      labelStyle: fontStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w400),
                      unselectedLabelStyle: fontStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      tabs: const [
                        Tab(text: 'Lead Details'),
                        Tab(text: 'Assigned Lead'),
                      ],
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          Column(
                            children: [
                              DataRowField(
                                title: "Lead Source",
                                value: "Bulk Upload",
                              ),
                              DataRowField(
                                title: "Product Requested",
                                value: "Mortgage",
                              ),
                              DataRowField(
                                title: "Product Sold",
                                value: "Mortgage Account",
                              ),
                              DataRowField(
                                title: "Lead Close Reason",
                                value: "Lost to competition",
                              ),
                              DataRowField(
                                title: "Recording Agent",
                                value: "Khary Fagbure",
                              )
                            ],
                          ),
                          // Contents of Tab 2
                          Center(
                            child: Text('Tab 2 Content'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
