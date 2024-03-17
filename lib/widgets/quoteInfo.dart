import 'package:flutter/material.dart';

import 'customDataField.dart';
import 'selectField.dart';

class QuoteInfo extends StatelessWidget {
  const QuoteInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const CustomDataField(
              name: "First Name", value: "Stacy", editable: false),
          const CustomDataField(
              name: "Middle Name", value: "Nyawira", editable: false),
          const CustomDataField(
              name: "Last Name", value: "Waruguru", editable: false),
          const CustomDataField(
              name: "Originating Lead Source",
              value: "Sales Agent",
              editable: false),
          const CustomDataField(
              name: "Quote ID", value: "QUO-02091-V2C8D9", editable: false),
          const CustomDataField(
              name: "Owning Business Unit", value: "Kenya", editable: false),
          const CustomDataField(name: "Lead ID", value: "0", editable: false),
          OptionField(
            options: const [
              {"label": "Agent portal", "value": "Agent portal"}
            ],
            onChanged: (value) {},
            title: 'Source',
          ),
          const CustomDataField(
              name: "Capturing User", value: "Jeremy Kibor", editable: false),
        ],
      ),
    );
  }
}
