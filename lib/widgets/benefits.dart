import 'package:dentsu_lms/constants/colors.dart';
import 'package:dentsu_lms/constants/funtions.dart';
import 'package:flutter/material.dart';

import 'selectField.dart';
import 'setting.dart';

class Benefits extends StatefulWidget {
  const Benefits({super.key});

  @override
  State<Benefits> createState() => _BenefitsState();
}

class _BenefitsState extends State<Benefits> {
  String selectedValue = 'mpesa';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OptionField(
            options: const [
              {"label": "KES 1,000,000", "value": "KES 1,000,000"}
            ],
            onChanged: (value) {},
            title: 'Inpatient Cover Limit',
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: getWidth(context),
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Benefits",
                  style: fontStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Setting(
                  title: "Inpatient",
                  value: true,
                  onChanged: (value) {},
                ),
                Setting(
                  title: "Outpatient",
                  value: false,
                  onChanged: (value) {},
                ),
                Setting(
                  title: "No Co-payment",
                  value: false,
                  onChanged: (value) {},
                ),
                Setting(
                  title: "Dental",
                  value: false,
                  onChanged: (value) {},
                ),
                Setting(
                  title: "Optical",
                  value: false,
                  onChanged: (value) {},
                ),
                Setting(
                  title: "Maternity",
                  value: false,
                  onChanged: (value) {},
                ),
                Setting(
                  title: "Last Expense",
                  value: false,
                  onChanged: (value) {},
                ),
                Setting(
                  title: "Personal Accident",
                  value: false,
                  onChanged: (value) {},
                ),
                Setting(
                  title: "Enhanced Covid 19 Cover",
                  value: false,
                  onChanged: (value) {},
                ),
                Setting(
                  title: "Amref Evacuation",
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: getWidth(context),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: primaryColor, width: 3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Premium Summary",
                        style: fontStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.info,
                        color: primaryColor,
                        size: 30,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: fontStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "KES 131,435",
                        style: fontStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RadioListTile(
                        visualDensity: VisualDensity.compact,
                        title: Text(
                          'M-PESA PayBill',
                          style: fontStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        value: 'mpesa',
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString();
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                        "assets/icons/mpesa.png",
                        width: 83,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RadioListTile(
                        visualDensity: VisualDensity.compact,
                        title: Text(
                          'Credit / Debit Card',
                          style: fontStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        value: 'cards',
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString();
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                        "assets/icons/cards.png",
                        width: 83,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
