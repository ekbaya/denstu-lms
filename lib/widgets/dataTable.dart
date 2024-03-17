import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:dentsu_lms/pages/leadDetails.dart';
import 'package:dentsu_lms/pages/quoteDetails.dart';
import 'package:dentsu_lms/utilities/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DataTableWithPagination extends StatefulWidget {
  final String title;
  final String tag;
  final String person;
  const DataTableWithPagination(
      {super.key,
      required this.title,
      required this.tag,
      required this.person});

  @override
  // ignore: library_private_types_in_public_api
  _DataTableWithPaginationState createState() =>
      _DataTableWithPaginationState();
}

class _DataTableWithPaginationState extends State<DataTableWithPagination> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          DataTable(
            dividerThickness: 0,
            columns: const [
              DataColumn(label: Text('#')),
              DataColumn(label: Text('Customer Name')),
            ],
            rows: List.generate(
              9,
              (index) => DataRow(
                color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (isEven(index + 1)) {
                      return Colors.white;
                    }
                    return backgroundColor;
                  },
                ),
                cells: [
                  DataCell(
                    GestureDetector(
                      onTap: () {
                        if (widget.tag == "leads" || widget.tag == "home") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LeadDetailsPage(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuoteDetailsPage(),
                            ),
                          );
                        }
                      },
                      child: Text('0${index + 1}'),
                    ),
                  ),
                  DataCell(
                    GestureDetector(
                      onTap: () {
                        if (widget.tag == "leads" || widget.tag == "home") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LeadDetailsPage(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuoteDetailsPage(),
                            ),
                          );
                        }
                      },
                      child: Text(widget.person),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Showing 1 to 10 of 200",
              style: fontStyle(
                  fontSize: 16, color: greyColor, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    currentPage > 1
                        ? () => setState(() => currentPage--)
                        : null;
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // Change color as needed
                        border: Border.all(color: Colors.grey)),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      5, // Total pages
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: currentPage == index + 1
                              ? primaryColor
                              : Colors.white,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                                color: currentPage == index + 1
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: currentPage == index + 1 ? 8 : 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    currentPage < 5
                        ? () => setState(() => currentPage++)
                        : null;
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // Change color as needed
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
