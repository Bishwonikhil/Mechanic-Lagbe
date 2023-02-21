import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:third_year_project/ui/login_screen.dart';
import 'package:third_year_project/ui/payment.dart';

import 'package:third_year_project/ui/privacy_policy.dart';

import '../contest/AppColors.dart';
import 'change_password.dart';
import 'help_info.dart';

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
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => LoginScreen()));
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


