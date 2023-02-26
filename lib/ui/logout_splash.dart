import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:third_year_project/ui/login_screen.dart';

import '../contest/AppColors.dart';
import 'decision.dart';

class LogSplash extends StatefulWidget {
  const LogSplash({Key? key}) : super(key: key);

  @override
  State<LogSplash> createState() => _LogSplashState();
}

class _LogSplashState extends State<LogSplash> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new Decision()),
          (route) => false),
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
                'https://assets10.lottiefiles.com/private_files/lf30_ixykrp0i.json',
                animate: true),
            //Fluttertoast.showToast(msg: "Wrong password provided for that user.");
          ],
        ),
      ),
    );
  }
}
