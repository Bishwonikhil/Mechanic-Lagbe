import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Contact extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us')),
      body: Container(
          child: Column(
            children: <Widget>[
              GFAccordion(
                title: "Do you want to contact the phone number?",
                content: "01643090684, 01756579767, 01771368759"
),            GFAccordion(
                title: "Do you want to contact the Email?",
                content: "sumonatikul@gmail.com, bishwo@gmail.com, ferdausi@gmail.com",
              ),

            ],
          )
      ),
    );
  }
}