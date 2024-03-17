import 'package:flutter/material.dart';

import 'selectField.dart';

class QuoteSetup extends StatelessWidget {
  const QuoteSetup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          OptionField(
            options: const [
              {"label": "18 to 30 years", "value": "18 to 30 years"}
            ],
            onChanged: (value) {},
            title: 'Age Bracket',
          ),
          OptionField(
            options: const [
              {"label": "KES 500,000", "value": "KES 500,000"}
            ],
            onChanged: (value) {},
            title: 'Inpatient Cover Limit',
          ),
          OptionField(
            options: const [
              {"label": "Yes", "value": "Yes"}
            ],
            onChanged: (value) {},
            title: 'Spouse Covered?',
          ),
          OptionField(
            options: const [
              {"label": "6 children", "value": "6 children"}
            ],
            onChanged: (value) {},
            title: 'How many children?',
          ),
          OptionField(
            options: const [
              {"label": "Yes", "value": "Yes"}
            ],
            onChanged: (value) {},
            title: 'Cover Children?',
          ),
          OptionField(
            options: const [
              {"label": "18 to 30 years", "value": "18 to 30 years"}
            ],
            onChanged: (value) {},
            title: 'Spouse Age Bracket',
          ),
        ],
      ),
    );
  }
}
