import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:third_year_project/ui/admin_car.dart';
import '../contest/AppColors.dart';
import 'admin_panel.dart';

class InsertSplash extends StatefulWidget {
  const InsertSplash({Key? key}) : super(key: key);

  @override
  State<InsertSplash> createState() => _InsertSplashState();
}

class _InsertSplashState extends State<InsertSplash> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
          () => Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminPanel())),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_orange,
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_kzgwt1om.json',
                animate: true),
            //Fluttertoast.showToast(msg: "Wrong password provided for that user.");
          ],
        ),
      ),
    );
  }
}
