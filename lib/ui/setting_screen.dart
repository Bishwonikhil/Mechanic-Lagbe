import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:share/share.dart';
import 'package:third_year_project/ui/contact.dart';
import 'package:third_year_project/ui/login_screen.dart';
import 'package:third_year_project/ui/payment.dart';
import 'package:third_year_project/ui/privacy-policy.dart';
import 'package:third_year_project/ui/rating_screen.dart';

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
  TextEditingController _bKashOtpController = TextEditingController();
  TextEditingController _bKashnbController = TextEditingController();
  TextEditingController _getAmount = TextEditingController();
  TextEditingController _getReference = TextEditingController();
  var obj = PaymentController();
  //var obj = PaymentScreen();

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
                title: //"Payment",
                'payment'.tr,
                icon: LineAwesomeIcons.hand_holding_us_dollar,
                // onPress: () {
                //   Navigator.push(context, CupertinoPageRoute(builder: (context) =>  const PaymentScreen()));
                // },
                //onPress: () => obj.makePayment(amount: '20', currency: 'USD'),
                onPress: () async{
                  await bkashDialog();
                },
              ),

              ProfileMenuWidget(
                  title: //"Privacy",
                  'contact'.tr,
                  icon: LineAwesomeIcons.lock,
                  onPress: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Contact()));
                  }),

              ProfileMenuWidget(
                  title:
                  'rate'.tr,
                  icon: LineAwesomeIcons.lock,
                  onPress: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => RatingPage()));
                  }),

              ProfileMenuWidget(
                  title: //"Weather",
                  'weather'.tr,
                  icon: LineAwesomeIcons.lock,
                  onPress: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => WeatherScreen()));
                  }),

              ProfileMenuWidget(
                  title: //"Compass",
                  'compass'.tr,
                  icon: LineAwesomeIcons.compass,
                  onPress: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Compass()));
                  }),
              ProfileMenuWidget(
                  title: //"App Guide",
                  'guide'.tr,
                  icon: LineAwesomeIcons.book_open,
                  onPress: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => AppGuide()));
                  }),
              ProfileMenuWidget(
                  title: //"Help & Support",
                  'help'.tr,
                  icon: LineAwesomeIcons.question_circle,
                  onPress: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => HelpInfo()));
                  }),
              ProfileMenuWidget(
                  title: //"Change Password",
                  'change pw'.tr,
                  icon: LineAwesomeIcons.lock,
                  onPress: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => Change_Password()));
                  }),

              ProfileMenuWidget(
                  title: //"Invite Friend",
                  'invite friend'.tr,
                  icon: LineAwesomeIcons.user_plus,
                  onPress: () {
                    Share.share("com.example.third_year_project");
                  }),

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
                    ],
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                title: //"Logout",
                'logout'.tr,
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                onPress: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  await auth.signOut();
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

  Future bkashDialog() => showDialog(
    builder: (context) => Dialog(
      child: Container(
        height: 350,
        color: Colors.pinkAccent.shade700,
        child: Stack(
          children: [
            //this container for bkash logo
            Container(
              height: 80,
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bkash_payment_logo.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            //SizedBox(height: 20,),

            Positioned(
              top: 90,
              left: 40,
              child: Container(
                //height: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your bkash account number',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            Padding(
              padding: EdgeInsets.only(top: 120, right: 40, left: 40),
              child: Container(
                height: 50,
                color: Colors.white,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  maxLength: 14,
                  controller: _bKashnbController,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(left: 5),
                    hintText: "e.g +8801XXXXXXXXX",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFBBBBBB),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
                padding: EdgeInsets.only(top: 190, left: 80),
                child: Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () async {
                      /*auth.verifyPhoneNumber(
                              phoneNumber: _bKashnbController.text,
                              verificationCompleted: (_) {},
                              verificationFailed: (e) {
                                Fluttertoast.showToast(
                                  msg: '' + e.toString(),
                                );
                              },
                              codeSent: (String verificationID, int? token) {
                                bKashOTP(verificationID: verificationID);

                              },
                              codeAutoRetrievalTimeout: (e) {
                                Fluttertoast.showToast(
                                  msg: '' + e.toString(),
                                );
                              });*/
                      //procceed();
                      await bKashOTP();
                      //await bKashOTP(verificationID: 'verificationID');

                      //await bKashOTP();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Procceed',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.shade700,
                      elevation: 3,
                    ),
                  ),
                )),

            Padding(
                padding: EdgeInsets.only(top: 240, left: 90),
                child: Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.shade700,
                      elevation: 3,
                    ),
                  ),
                )),

            Padding(
              padding: EdgeInsets.only(top: 300),
              child: BackButton(
                color: Colors.white,
                onPressed: () {},
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 310, left: 200),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.pinkAccent.shade700,
                backgroundImage: const NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/159/159832.png'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 295, left: 220),
              child: TextButton(
                child: const Text(
                  '16247',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('16247');
                },
              ),
            ),
          ],
        ),
      ),
    ),
    context: context,
    //builder: (BuildContext context) {},
  );
/*{required String verificationID}*/
  Future bKashOTP() => showDialog(
    builder: (context) => Dialog(
      child: Container(
        height: 350,
        color: Colors.pinkAccent.shade700,
        child: Stack(
          children: [
            //this container for bkash logo
            Container(
              height: 80,
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bkash_payment_logo.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            //SizedBox(height: 20,),

            Positioned(
              top: 90,
              left: 40,
              child: Container(
                //height: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your bkash account OTP',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            Padding(
              padding: EdgeInsets.only(top: 120, right: 40, left: 40),
              child: Container(
                height: 30,
                color: Colors.white,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  //maxLength: 11,
                  controller: _bKashOtpController,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(left: 5),
                    hintText: " bKash Verification Code",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFBBBBBB),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
                padding: EdgeInsets.only(top: 170, left: 80),
                child: Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () async {
                      /*final credential = PhoneAuthProvider.credential(
                            verificationId: verificationID,
                            smsCode: _bKashOtpController.text.toString(),
                          );
                          try {
                            Navigator.pop(context);
                            await auth.signInWithCredential(credential);
                            await getAmount();
                          } catch (e) {
                            print(e);
                          }*/
                      await getAmount();
                    },
                    child: Text(
                      'Procceed',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.shade700,
                      elevation: 3,
                    ),
                  ),
                )),

            /*Padding(
                  padding: EdgeInsets.only(top: 210, left: 65),
                  child: Container(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () async {
                        //await bKashOTP();
                      },
                      child: Text(
                        'Resend Code',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent.shade700,
                        elevation: 3,
                      ),
                    ),
                  ),
                ),*/

            Padding(
                padding: EdgeInsets.only(top: 220, left: 90),
                child: Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.shade700,
                      elevation: 3,
                    ),
                  ),
                )),

            Padding(
              padding: EdgeInsets.only(top: 300),
              child: BackButton(
                color: Colors.white,
                onPressed: () {},
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 310, left: 200),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.pinkAccent.shade700,
                backgroundImage: const NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/159/159832.png'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 295, left: 220),
              child: TextButton(
                child: const Text(
                  '16247',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('16247');
                },
              ),
            ),
          ],
        ),
      ),
    ),
    context: context,
    //builder: (BuildContext context) {},
  );

  Future getAmount() => showDialog(
    builder: (context) => Dialog(
      child: Container(
        height: 350,
        color: Colors.pinkAccent.shade700,
        child: Stack(
          children: [
            //this container for bkash logo
            Container(
              height: 80,
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bkash_payment_logo.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            //SizedBox(height: 20,),

            Positioned(
              top: 90,
              left: 40,
              child: Container(
                //height: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Enter Amount',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            Padding(
              padding: EdgeInsets.only(top: 120, right: 40, left: 40),
              child: Container(
                height: 30,
                color: Colors.white,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  //maxLength: 11,
                  controller: _getAmount,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(left: 5),
                    hintText: " Service Charge",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFBBBBBB),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 150,
              left: 40,
              child: Container(
                //height: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Reference',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 170, right: 40, left: 40),
              child: Container(
                height: 30,
                color: Colors.white,
                child: TextField(
                  textAlign: TextAlign.center,
                  //keyboardType: TextInputType.number,
                  //maxLength: 11,
                  controller: _getReference,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(left: 5),
                    hintText: " Mechanic's number",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFBBBBBB),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 210, left: 80),
              child: Container(
                height: 30,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    paymentSuccessful();
                    var getAmount = _getAmount.text.toString();
                    var getRef = _getReference.text.toString();
                    var amount = int.parse(getAmount);
                    //var number = int.parse(getAmount);
                    FirebaseFirestore.instance
                        .collection('Payment')
                        .add({'Bill': amount,'Number': getRef}).then(
                            (value) => print("Added Amount"));
                    /*await users.add({
                      'Bill': _getAmount,
                    }).then((value) => print('Added Bill'));
                    Fluttertoast.showToast(msg: "Payment Successful.");*/

                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationButton()));


                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent.shade700,
                    elevation: 3,
                  ),
                ),
              ),
            ),


            Padding(
                padding: EdgeInsets.only(top: 250, left: 90),
                child: Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop;
                    },
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.shade700,
                      elevation: 3,
                    ),
                  ),
                )),

            Padding(
              padding: EdgeInsets.only(top: 300),
              child: BackButton(
                color: Colors.white,
                onPressed: () {},
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 310, left: 200),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.pinkAccent.shade700,
                backgroundImage: const NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/159/159832.png'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 295, left: 220),
              child: TextButton(
                child: const Text(
                  '16247',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('16247');
                },
              ),
            ),
          ],
        ),
      ),
    ),
    context: context,
    //builder: (BuildContext context) {},
  );


  void paymentSuccessful(){
    QuickAlert.show(
      context: context,
      text: 'Payment Successful',
      type: QuickAlertType.success,
      titleColor: Colors.red,
      confirmBtnColor: Colors.cyan,
      //backgroundColor: Colors.blueGrey
    );
    print('Payment Successful');
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
