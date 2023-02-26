import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:third_year_project/ui/Mechanic%20UI/mechanic_navigation.dart';
import 'package:third_year_project/ui/Mechanic%20UI/methods.dart';
import 'package:third_year_project/ui/home_screen.dart';
import 'package:third_year_project/ui/user_form.dart';
import 'package:third_year_project/ui/verify_email.dart';
import '../../contest/AppColors.dart';
//import '../contest/AppColors.dart';
import '../login_screen.dart';
import '../navigation_button.dart';
//import 'login_screen.dart';

class MechanicRegistration extends StatefulWidget {
  @override
  _MechanicRegistrationState createState() => _MechanicRegistrationState();
}

class _MechanicRegistrationState extends State<MechanicRegistration> {
  TextEditingController _mechanicEmail = TextEditingController();
  TextEditingController _mechanicPassword = TextEditingController();
  TextEditingController _mechanicNumber = TextEditingController();
  TextEditingController _mechanicName = TextEditingController();
  //TextEditingController _otpController = TextEditingController();
  bool _obscureText = true;
  bool isLoading = false;

  /*void sentOTP() async {
    try{
      EmailAuth emailAuth = EmailAuth(sessionName: "Test session");
      var res = await emailAuth.sendOtp(recipientMail: _emailController.text);
      if (res) {
        print("OTP sent");
      } else {
        print('Some problems occured to sent the otp');
      }
    }catch(e){
      print(e);
    }
  }*/

  /*void verifyOTP() {
    try{
      EmailAuth emailAuth = EmailAuth(sessionName: "Test session");
      var res = emailAuth.validateOtp(
          recipientMail: _emailController.text, userOtp: _otpController.text);
      if (res)
        print("Hey Otp Verified sucessfully!");
      else
        print("Please Check your Otp!!");
    }catch(e){
      print(e);
    }
  }*/

  signUp(String name,String number) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: _mechanicEmail.text, password: _mechanicPassword.text);
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if (authCredential.uid.isNotEmpty) {
        FirebaseFirestore.instance.collection("User").doc(authCredential.uid).set({
          'name': name,
          'email': authCredential.email,
          'number': number,
          'uid': FirebaseAuth.instance.currentUser!.uid,
          'imageUrl': '',

        });
        Navigator.push(
            context, CupertinoPageRoute(builder: (_) => VerifyEmailPage()));
      } else {
        Fluttertoast.showToast(msg: "Something is wrong");
      }
      /*await userCredential.user!.sendEmailVerification();
      return userCredential;*/
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email.");
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
            /*StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context,snapshot){
                if(snapshot.hasData){
                  return VerifyEmailPage();
                }else{

                }
                return SizedBox();
                }
            ),*/
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
                      'https://assets5.lottiefiles.com/packages/lf20_L7YrbxFm46.json',
                      height: 140,
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
                          "Welcome! Sign Up",
                          style: TextStyle(
                              fontSize: 22.sp, color: AppColors.deep_orange),
                        ),
                        Text(
                          "Glad to see you.",
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
                                  Icons.call,
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
                                controller: _mechanicName,
                                //keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: "name",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xFFBBBBBB),
                                  ),
                                  labelText: 'NAME',
                                  labelStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.deep_orange,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                                  hintText: "abcd@gmail.com",
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
                                    ),
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
                                  Icons.call,
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
                                controller: _mechanicNumber,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: "number",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xFFBBBBBB),
                                  ),
                                  labelText: 'NUMBER',
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
                          height: 50.h,
                        ),
                        // elevated button
                        SizedBox(
                          width: 1.sw,
                          height: 56.h,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_mechanicName.text.isNotEmpty &&
                                  _mechanicEmail.text.isNotEmpty &&
                                  _mechanicPassword.text.isNotEmpty&&_mechanicNumber.text.isNotEmpty) {
                                setState(() {
                                  isLoading = true;
                                });

                                createAccount1(_mechanicName.text, _mechanicEmail.text, _mechanicNumber.text, _mechanicPassword.text).then((user) {
                                  if (user != null) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (_) => VerifyEmailPage()));
                                    print("Account created Succesfull");
                                  } else {
                                    print("Account created Failed");
                                  }
                                });
                              } else {
                                print("Please enter Fields");
                              }
                              //signUp(_mechanicName.text,_mechanicNumber.text);
                            },
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.sp),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.deep_orange,
                              elevation: 3,
                            ),
                          ),
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
                                " Sign In",
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
                                        builder: (context) => LoginScreen()));
                              },
                            )
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