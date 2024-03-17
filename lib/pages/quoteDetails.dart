import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:dentsu_lms/widgets/benefits.dart';
import 'package:dentsu_lms/widgets/quoteInfo.dart';
import 'package:dentsu_lms/widgets/quoteSetup.dart';
import 'package:flutter/material.dart';

class QuoteDetailsPage extends StatefulWidget {
  const QuoteDetailsPage({super.key});

  @override
  State<QuoteDetailsPage> createState() => _QuoteDetailsPageState();
}

class _QuoteDetailsPageState extends State<QuoteDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        title: const Text(
          "Quote : QUO-02091-V2C8D9",
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "View Quote",
                  style: fontStyle(
                      fontSize: 30,
                      color: blackColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
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
                  Tab(text: 'Quote Information'),
                  Tab(text: 'Setup'),
                  Tab(text: 'Benefits'),
                ],
              ),
              SizedBox(
                width: getWidth(context),
                height: 1300,
                child: const TabBarView(
                  children: [
                    QuoteInfo(),
                    QuoteSetup(),
                    Benefits(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
