import 'package:dentsu_lms/constants/funtions.dart';
import 'package:flutter/material.dart';

import 'dataTable.dart';
import 'titleBar.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

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
              title: 'Quotes',
              buttonText: 'New quote',
              onAddButtonClicked: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            const DataTableWithPagination(
              title: 'Quotes',
              tag: 'quotes',
              person: 'Dylan Baraka',
            )
          ],
        ),
      ),
    );
  }
}
