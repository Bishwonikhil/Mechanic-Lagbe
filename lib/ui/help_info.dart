import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            title: //"How much do you charge?",
            'charge'.tr,
            content:
                //"The price depend on the service. You can select a service to see the cost.",
            'chargeI'.tr,
          ),
          GFAccordion(
            title: //"How long will it take?",
            'take'.tr,
            content:
                //"The time is mentioned on each service when you book the service.",
            'takeI'.tr,

          ),
          GFAccordion(
            title: //"What is refund policy?",
            'refund'.tr,
            content: //"There are no refunds.",
            'refundI'.tr,
          ),
        ],
      )),
    );
  }
}
