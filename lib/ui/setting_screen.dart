import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:third_year_project/contest/AppColors.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final List locale =[
    {'name':'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'বাংলা', 'locale': Locale('bn', 'BN')},
  ];

  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }

  buildDialog(BuildContext context){
    showDialog
      (context: context,
        builder: (builder){
          return AlertDialog(
            title: Text("Choose a language"),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: (){
                            print(locale[index]['name']);
                            updateLanguage(locale[index]['locale']);

                          },
                          child: Text(locale[index]['name'])),
                    );

                  },
                  separatorBuilder: (context, index){
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
        title:  Text(
          //"Settings",
          'AppBarS'.tr,
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
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.dark_mode),
                      Text(
                        //'   Dark Mode                                ',
                        'mode'.tr,
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
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
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],

                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.policy),
                      Text(
                        //'   Privacy Policy                           ',
                        'privacyP'.tr,
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
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