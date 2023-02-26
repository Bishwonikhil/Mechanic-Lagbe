import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../widget/my_button.dart';
import 'Mechanic UI/mechanic_login.dart';
import 'login_screen.dart';

class Decision extends StatefulWidget {
  const Decision({Key? key}) : super(key: key);

  @override
  State<Decision> createState() => _DecisionState();
}

class _DecisionState extends State<Decision> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Lottie.network(
                'https://assets1.lottiefiles.com/packages/lf20_G5TBf4.json'),
            SizedBox(
              height: 50,
            ),
            DecisionButton(
              'assets/images/user.png',
              'Login As a User',
              ()  {

                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (context) => new LoginScreen()),
                    (route) => false);
              },
              Get.width * 0.8,
            ),
            SizedBox(
              height: 20,
            ),
            DecisionButton(
              'assets/images/mechanic1.png',
              'Login As a Mechanic',
              () {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (context) => new MechanicLogin()),
                    (route) => false);
              },
              Get.width * 0.8,
            )
          ],
        ),
      ),
    );
  }
}
