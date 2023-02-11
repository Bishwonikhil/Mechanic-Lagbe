import 'dart:async';

import 'package:flutter/material.dart';
import 'package:third_year_project/ui/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:third_year_project/widget/customButton.dart';

import '../contest/AppColors.dart';
import 'navigation_button.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    //user needs to created before!
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    //call after email verification
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();

      setState(() {
        canResendEmail = false;
      });

      await Future.delayed(Duration(seconds: 5));

      setState(() {
        canResendEmail = true;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? NavigationButton()
      : Scaffold(
          appBar: AppBar(
            title: Text('Verify Email',style: TextStyle(fontFamily: 'TitanOne'),),
            backgroundColor: AppColors.deep_orange,
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A email verification link has been sent to your email',
                  style: TextStyle(fontFamily: 'TitanOne', fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                customButton('Request Sent', (){}),
                /*ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.email,
                    size: 30,
                  ),
                  label: Text(
                    'Request Sent',
                    style: TextStyle(fontFamily: 'TitanOne', fontSize: 24),
                  ),

                ),*/
                TextButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 24, fontFamily: 'TitanOne',color: AppColors.deep_orange),
                  ),
                ),
              ],
            ),
          ),
        );
}
