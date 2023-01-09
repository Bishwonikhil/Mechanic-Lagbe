import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        title: const Text(
          "More",
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
                        '   Help & Info',
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
                        '   Rate App',
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
                        '   Share App',
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
                        '   Contact Us',
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
}
