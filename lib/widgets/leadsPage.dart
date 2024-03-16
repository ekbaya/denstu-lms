import 'package:dentsu_lms/constants/funtions.dart';
import 'package:flutter/material.dart';

import 'dataTable.dart';
import 'titleBar.dart';

class LeadsPage extends StatefulWidget {
  const LeadsPage({super.key});

  @override
  State<LeadsPage> createState() => _LeadsPageState();
}

class _LeadsPageState extends State<LeadsPage> {
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
            PageTitleBar(
              title: 'Leads',
              buttonText: 'New lead',
              onAddButtonClicked: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            const DataTableWithPagination(
              title: 'New Leads',
              tag: 'leads',
              person: 'Faith Neema',
            )
          ],
        ),
      ),
    );
  }
}
