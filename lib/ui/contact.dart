import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../contest/AppColors.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: AppColors.deep_orange,
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          GFAccordion(
              title: 'phone'.tr,//"Do you want to contact the phone number?",
              content: "01643090684, 01756579767, 01771368759"),
          GFAccordion(
            title: 'email'.tr,//"Do you want to contact the Email?",
            content:
                "sumonatikul@gmail.com, bishwo@gmail.com, ferdausi@gmail.com",
          ),
        ],
      )),
    );
  }
}
