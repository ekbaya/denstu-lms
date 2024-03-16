import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:dentsu_lms/widgets/totalLeads.dart';
import 'package:dentsu_lms/widgets/totalProducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dataTable.dart';
import 'leads.dart';
import 'requests.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      width: getWidth(context),
      height: getHeight(context),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard",
              style: fontStyle(
                  fontSize: 30, fontWeight: FontWeight.w500, color: textColor),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: getWidth(context),
              height: 310,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  const TotalLeads(),
                  const Leads(),
                  Requests(),
                  const TotalProducts(),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const DataTableWithPagination(
              title: 'New Leads',
              tag: 'home',
              person: 'Elias Baya',
            )
          ],
        ),
      ),
    );
  }
}
