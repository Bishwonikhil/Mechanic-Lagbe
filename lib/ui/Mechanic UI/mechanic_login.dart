import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:third_year_project/ui/Mechanic%20UI/mechanic_navigation.dart';
import 'package:third_year_project/ui/forgot_pw.dart';
import 'package:third_year_project/ui/registration_screen.dart';
import '../../contest/AppColors.dart';
import '../../widget/customButton.dart';
import '../admin_panel.dart';
import '../navigation_button.dart';
import 'mechanic_registration.dart';
import 'methods.dart';
// import '../contest/AppColors.dart';
// import '../navigation_button.dart';
// import '../widget/customButton.dart';
// import 'admin_login.dart';
// import 'navigation_button.dart';

class MechanicLogin extends StatefulWidget {
  @override
  _MechanicLoginState createState() => _MechanicLoginState();
}

class _MechanicLoginState extends State<MechanicLogin> {
  TextEditingController _mechanicEmail = TextEditingController();
  TextEditingController _mechanicPassword = TextEditingController();
  bool _obscureText = true;
  bool isLoading = true;

  signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: _mechanicEmail.text, password: _mechanicPassword.text);
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (_) => MechanicNavigation()));
      } else {
        Fluttertoast.showToast(msg: "Something is wrong");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deep_orange,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
              width: ScreenUtil().screenWidth,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Lottie.network(
                        'https://assets4.lottiefiles.com/private_files/lf30_kj1v7uim.json',
                        //height: ScreenUtil().scaleHeight,
                        // fit: BoxFit.fill,
                        height: 140
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Welcome! Sign In",
                          style: TextStyle(
                              fontSize: 22.sp, color: AppColors.deep_orange),
                        ),
                        Text(
                          "Glad to see you back.",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFFBBBBBB),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 48.h,
                              width: 41.w,
                              decoration: BoxDecoration(
                                color: AppColors.deep_orange,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                  size: 20.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _mechanicEmail,
                                decoration: InputDecoration(
                                  hintText: "abcd9954@gmail.com",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xFFBBBBBB),
                                  ),
                                  labelText: 'EMAIL',
                                  labelStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.deep_orange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 48.h,
                              width: 41.w,
                              decoration: BoxDecoration(
                                color: AppColors.deep_orange,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white,
                                  size: 20.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _mechanicPassword,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: "password must be 6 character",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xFFBBBBBB),
                                  ),
                                  labelText: 'PASSWORD',
                                  labelStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.deep_orange,
                                  ),
                                  suffixIcon: _obscureText == true
                                      ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = false;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove_red_eye,
                                        size: 20.w,
                                      ))
                                      : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = true;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.visibility_off,
                                        size: 20.w,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.deep_orange,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 30.h,
                        ),
                        // elevated button
                        customButton(
                          "Sign In",
                              () {
                                if (_mechanicEmail.text.isNotEmpty && _mechanicPassword.text.isNotEmpty) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  login1(_mechanicEmail.text, _mechanicPassword.text).then((user) {
                                    if (user != null) {
                                      print("Login Sucessffull");
                                      setState(() {
                                        isLoading = false;
                                      });
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (_) => MechanicNavigation()));
                                    } else {
                                      print("Login Failed");
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  });
                                } else {
                                  print("Please fill form correctly");
                                }

                            //signIn();
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Wrap(
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFBBBBBB),
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                " Sign Up",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.deep_orange,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            MechanicRegistration()));
                              },
                            ),
                            SizedBox(width: 100,),
                           /* GestureDetector(
                              child: Text(
                                " Admin",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.deep_orange,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            AdminLoginScreen()));
                              },
                            ),*/
                          ],

                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
