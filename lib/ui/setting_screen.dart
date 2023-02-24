import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:third_year_project/ui/login_screen.dart';
import 'package:third_year_project/ui/payment.dart';
import 'package:third_year_project/ui/privacy-policy.dart';

//import 'package:third_year_project/ui/privacy_policy.dart';

import '../contest/AppColors.dart';
import '../services/weather_screen.dart';
import 'app_guide.dart';
import 'change_password.dart';
import 'compass.dart';
import 'help_info.dart';
import 'logout_splash.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var obj = PaymentController();
  //var obj = PaymentScreen();
  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(LineAwesomeIcons.angle_left),
        // ),
        title: Text(
          'AppBarS'.tr,
        ),
        backgroundColor: AppColors.deep_orange,
        automaticallyImplyLeading: false,
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              //MENU
              ProfileMenuWidget(
                title: "Payment",
                //'payment'.tr,
                icon: LineAwesomeIcons.hand_holding_us_dollar,
                // onPress: () {
                //   Navigator.push(context, CupertinoPageRoute(builder: (context) =>  const PaymentScreen()));
                // },
                onPress: () => obj.makePayment(amount: '20', currency: 'USD'),
              ),
              ProfileMenuWidget(
                  title: "Privacy",
                  //'privacy'.tr,
                  icon: LineAwesomeIcons.lock,
                  onPress: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Privacy()));
                  }),

              ProfileMenuWidget(
                  title: "Weather",
                  //'privacy'.tr,
                  icon: LineAwesomeIcons.lock,
                  onPress: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => WeatherScreen()));
                  }),

              ProfileMenuWidget(
                  title: "Compass",
                  //'privacy'.tr,
                  icon: LineAwesomeIcons.compass,
                  onPress: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Compass()));
                  }),
              ProfileMenuWidget(
                  title: "App Guide",
                  //'privacy'.tr,
                  icon: LineAwesomeIcons.book_open,
                  onPress: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => AppGuide()));
                  }),
              ProfileMenuWidget(
                  title: "Help & Support",
                  //'help'.tr,
                  icon: LineAwesomeIcons.question_circle,
                  onPress: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => HelpInfo()));
                  }),
              ProfileMenuWidget(
                  title: "Change Password",
                  //'change pw'.tr,
                  icon: LineAwesomeIcons.lock,
                  onPress: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => Change_Password()));
                  }),

              ProfileMenuWidget(
                  title: "Invite Friend",
                  //'invite friend'.tr
                  icon: LineAwesomeIcons.user_plus,
                  onPress: () {
                    Share.share("com.example.third_year_project");
                  }),
              const Divider(),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                title: "Logout",
                // 'logout'.tr,
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                onPress: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(
                          builder: (context) => new LogSplash()),
                      (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.deep_orange.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: AppColors.deep_orange,
        ),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyText1?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.deep_orange.withOpacity(0.1),
              ),
              child: Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.grey))
          : null,
    );
  }
}

/*
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
              */
/*buildAcountOption(context, 'Language'),
              buildAcountOption(context, 'Dark Mode'),
              buildAcountOption(context, 'Terms & Condition'),
              buildAcountOption(context, 'Privacy Policy'),*/ /*


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
                      */
/*Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black38,
                      ),*/ /*

                    ],
                  ),
                ),
              ),
              */
/*GestureDetector(
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
                      */ /*
*/
/*Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),*/ /*
*/
/*
                    ],
                  ),
                ),
              ),*/ /*

              */
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
                      */ /*
*/
/*Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),*/ /*
*/
/*
                    ],

                  ),
                ),
              ),*/ /*

              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.beenhere),
                      Text(
                        //'   Privacy Policy                           ',
                        //'privacyP'.tr,
                        'terms'.tr,
                        style: TextStyle(
                          fontSize: 20,),
                      ),
                      */
/*Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),*/ /*

                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

*/
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
  }*/ /*

}*/
