import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../contest/AppColors.dart';

class Privacy extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Privacy Policy'),
        backgroundColor: AppColors.deep_orange,
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              GFAccordion(
                title: "Privacy Policy",
                content: "Welcome to Mechanic Lagbe! Mechanic Lagbe, a private company limited by shares, incorporated under the Companies Act 2022 of Bangladesh hereinafter referred to as ML, has developed, under the brand, Mechanic Lagbe mobile/web-based online platforms (hereinafter referred to as the Applications and websites, including but not limited to, www.mechaniclagbe.com, and/or other sub-domains, including but not limited to, www.mechaniclagbe.com. to connect vehicle owners and operators with individuals or entities in need of transportation services (hereinafter individually referred to as user and collectively as users). ML is committed to maintaining robust privacy protections for its users. Our Privacy Policy is designed to help you understand how we collect, use, share and safeguard the information you provide to us and to assist you in making informed decisions when using our service. The terms we, or our, refer to ML. You refers to you (customer requiring mechanic services or owner/driver/operator of a vehicle, as the case may be), as a user of our service. Service refers to the service ML provides of connecting users. By accepting our Privacy Policy, you consent to our collection, storage, use and disclosure of your personal information as described in this Privacy Policy.",
              ),
            ],
          )
      ),
    );
  }
}