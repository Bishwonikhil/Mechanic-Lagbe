import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../widget/my_button.dart';
import 'login_screen.dart';

class Decision extends StatefulWidget {
  const Decision({Key? key}) : super(key: key);

  @override
  State<Decision> createState() => _DecisionState();
}

class _DecisionState extends State<Decision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Lottie.network('https://assets1.lottiefiles.com/packages/lf20_G5TBf4.json'),
            SizedBox(height: 50,),
            DecisionButton(
              'assets/images/Profile.png',
              'Login As a User',
                (){},
              Get.width*0.8,
            ),
            SizedBox(height: 20,),
            DecisionButton(
              'assets/images/Mechanic.webp',
              'Login As a Mechanic',
                  (){},
              Get.width*0.8,
            )
          ],
        ),
      ),
    );
  }
}
