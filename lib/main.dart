import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_year_project/ui/authenticate.dart';
import 'package:third_year_project/ui/splash_screen1.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'ui/local_string.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51MPNfGHdowuvC8uFcyiOhDhHKUTnWVk4RkNlVEDhAOqAHskoMhmCWKR8fer6PxNufSfGBbZaZl9sOCwLDBAcCh3D00vxdh0hH1';
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,812),
      builder: (BuildContext context,child) => GetMaterialApp(
        translations: LocalString(),
        locale: Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Authenticate(),
      ),
    );
  }
}
