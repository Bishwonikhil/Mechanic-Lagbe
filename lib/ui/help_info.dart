import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../contest/AppColors.dart';

class HelpInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Info'),
        backgroundColor: AppColors.deep_orange,
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          GFAccordion(
            title: "How much do you charge?",
            content:
                "The price depend on the service. You can select a service to see the cost.",
          ),
          GFAccordion(
            title: "How long will it take?",
            content:
                "The time is mentioned on each service when you book the service.",
          ),
          GFAccordion(
            title: "What is refund policy?",
            content: "There are no refunds.",
          ),
        ],
      )),
    );
  }
}
