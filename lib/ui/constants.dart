import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
const String tProfile = "Profile";
const String tEditProfile = "Edit Profile";
const String tLogoutDialogHeading = "Logout";
const String tProfileHeading = "Sumon";
const String tProfileSubHeading = "sumonatikul@gmail.com";

//const String tMenu5 = tLogout;
const String tMenu1 = "Privacy";
const String tMenu2 = "Change Password";
const String tMenu3 = "Help & Support";
const String tMenu4 = "Invite Friend";

const String tDelete = "Delete";
const String tJoined = "joined";
const kSpacingUnit = 10;


 //import 'package:flutter/material.dart';
 //import 'package:flutter_screenutil/flutter_screenutil.dart';

 //const kSpacingUnit = 10;

 const kDarkPrimaryColor = Color(0xFF212121);
 const kDarkSecondaryColor = Color(0xFF373737);
 const kLightPrimaryColor = Color(0xFFFFFFFF);
 const kLightSecondaryColor = Color(0xFFF3F7FB);
 const kAccentColor = Color(0xFFFFC107);

final kTitleTextStyle = TextStyle(
   fontSize: ScreenUtil().setHeight(kSpacingUnit.w * 1.7),
   fontWeight: FontWeight.w600,
 );

 final kCaptionTextStyle = TextStyle(
   fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
   fontWeight: FontWeight.w100,
 );

 final kButtonTextStyle = TextStyle(
   fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
   fontWeight: FontWeight.w400,
   color: kDarkPrimaryColor,
 );

 final kDarkTheme = ThemeData(
   brightness: Brightness.dark,
  fontFamily: 'TitanOne',
   primaryColor: kDarkPrimaryColor,
   canvasColor: kDarkPrimaryColor,
   backgroundColor: kDarkSecondaryColor,
   accentColor: kAccentColor,
   iconTheme: ThemeData.dark().iconTheme.copyWith(
     color: kLightSecondaryColor,
   ),
   textTheme: ThemeData.dark().textTheme.apply(
     fontFamily: 'TitanOne',
     bodyColor: kLightSecondaryColor,
     displayColor: kLightSecondaryColor,
   ),
 );

 final kLightTheme = ThemeData(
   brightness: Brightness.light,
   fontFamily: 'TitanOne',
  primaryColor: kLightPrimaryColor,
   canvasColor: kLightPrimaryColor,
   backgroundColor: kLightSecondaryColor,
   accentColor: kAccentColor,
   iconTheme: ThemeData.light().iconTheme.copyWith(

   color: kDarkSecondaryColor,
   ),
   textTheme: ThemeData.light().textTheme.apply(
     fontFamily: 'TitanOne',
     bodyColor: kDarkSecondaryColor,
     displayColor: kDarkSecondaryColor,
  ),
 );
