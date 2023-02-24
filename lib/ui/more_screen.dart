import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:third_year_project/contest/AppColors.dart';
import 'package:third_year_project/ui/rating_screen.dart';

import 'contact.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'বাংলা', 'locale': Locale('bn', 'BN')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildDialog(BuildContext context) {
    showDialog
      (context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text("Choose a language"),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            print(locale[index]['name']);
                            updateLanguage(locale[index]['locale']);
                          },
                          child: Text(locale[index]['name'])),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.redAccent,
                    );
                  },
                  itemCount: locale.length
              ),
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //"Settings",
          'AppBarM'.tr,
        ),
        backgroundColor: AppColors.deep_orange,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.only(top: 15.0),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              /*buildAcountOption(context, 'Language'),
              buildAcountOption(context, 'Dark Mode'),
              buildAcountOption(context, 'Terms & Condition'),
              buildAcountOption(context, 'Privacy Policy'),*/

              GestureDetector(
                onTap: () {
                  buildDialog(context);
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.g_translate),
                      Text(
                        //'   Language                                  ',
                        'language'.tr,
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                      /*Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black38,
                      ),*/
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => Contact()));
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.call),
                      Text(
                        //'   Dark Mode                                ',
                        'contact'.tr,
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                      /*Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),*/
                    ],
                  ),
                ),
              ),
              /*GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.beenhere),
                      Text(
                        //'  Terms & Condition                  ',
                        'terms'.tr,
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                      */ /*Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),*/ /*
                    ],

                  ),
                ),
              ),*/
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => RatingPage()));
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star),
                      Text(
                        //'   Privacy Policy                           ',
                        //'privacyP'.tr,
                        'rate'.tr,
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                      /*Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),*/
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

/*GestureDetector buildAcountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_forward_ios,color: Colors.grey,),
          ],
        ),
      ),
    );
  }*/
}















/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:third_year_project/contest/AppColors.dart';

import 'package:flutter/material.dart';
import 'package:third_year_project/contest/AppColors.dart';
import 'package:third_year_project/ui/rating_screen.dart';

import 'contact.dart';
//import 'contactus.dart';
import 'help_info.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //"More",
          'AppBarM'.tr,
        ),
        backgroundColor: AppColors.deep_orange,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.only(top: 15.0),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              */
/*buildAcountOption(context, 'Language'),
              buildAcountOption(context, 'Dark Mode'),
              buildAcountOption(context, 'Terms & Condition'),
              buildAcountOption(context, 'Privacy Policy'),*//*


              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => HelpInfo()));
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.info),
                      Text(
                        //'   Help & Info',
                        'helpI'.tr,
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                      */
/*Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black38,
                      ),*//*

                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => RatingPage()));
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star),
                      Text(
                        //'   Rate App',
                        'rate'.tr,
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                      */
/*Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),*//*

                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Share.share("com.example.third_year_project");
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.share),
                      Text(
                        //'   Share App',
                        'share'.tr,
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                      */
/*Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),*//*

                    ],

                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => Contact()));
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.call),
                      Text(
                        //'   Contact Us',
                        'contact'.tr,
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                      */
/*Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),*//*

                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}*/
