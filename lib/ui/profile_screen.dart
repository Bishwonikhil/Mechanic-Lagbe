import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:third_year_project/ui/login_screen.dart';
import 'package:third_year_project/ui/payment.dart';
import 'package:third_year_project/ui/privacy_policy.dart';
import '../contest/AppColors.dart';
import 'change_password.dart';
import 'constants.dart';
import 'forgot_pw.dart';
import 'help_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var obj = PaymentController();
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          //tProfile,
          'AppBarP'.tr,
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      child: image != null
                          ? Image.file(image!)
                          : FlutterLogo(size: 160),

                      borderRadius: BorderRadius.circular(100),
                      //     child: Image(image: AssetImage("assets/images/car.webp"),)),
                    ),
                    // child: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Spacer(),
                    // ),
                    // image != null ? Image.file(image!) : FlutterLogo(size: 160),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.deep_orange,
                          ),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()),
                              );
                            },
                            child: Icon(LineAwesomeIcons.alternate_pencil,
                                size: 20, color: Colors.black),
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                tProfileHeading,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                tProfileSubHeading,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed:
                      () {}, //=> Get.to(()=> const UpdateProfileScreen()),
                  child: Text(
                    //tEditProfile,
                    'edit'.tr,
                    style: TextStyle(color: Colors.black87),
                  ),

                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              //MENU
              ProfileMenuWidget(
                title: 'payment'.tr,//"Payment",
                icon: LineAwesomeIcons.hand_holding_us_dollar,
                onPress: () {
                  //Navigator.push(context, CupertinoPageRoute(builder: (context) => makePayment()));
                },
                //onPress: () => obj.makePayment(amount: '5', currency: 'USD'),
              ),
              ProfileMenuWidget(
                  title: 'privacy'.tr,//"Privacy",
                  icon: LineAwesomeIcons.lock,
                  onPress: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Privacy()));
                  }),
              ProfileMenuWidget(
                  title: 'help'.tr,//"Help & Support",
                  icon: LineAwesomeIcons.question_circle,
                  onPress: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => HelpInfo()));
                  }),
              ProfileMenuWidget(
                  title: 'change pw'.tr,//"Change Password",
                  icon: LineAwesomeIcons.lock,
                  onPress: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => Change_Password()));
                  }),
              ProfileMenuWidget(
                  title: 'invite friend'.tr,//"Invite Friend",
                  icon: LineAwesomeIcons.user_plus,
                  onPress: () {
                    Share.share("com.example.third_year_project");
                  }),
              const Divider(),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                title: 'logout'.tr,//"Logout",
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

  Widget bottomSheet() {
    return Container(
        height: 100.0,
        //width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            Text(
              "Choose Profile photo",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () => {
                    pickImage(ImageSource.camera),
                  },
                  icon: Icon(Icons.camera),
                ),
                IconButton(
                  onPressed: () => {
                    pickImage(ImageSource.gallery),
                  },
                  icon: Icon(Icons.image),
                ),
                /*FlatButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: () => {
                    pickImage(ImageSource.camera),
                  },
                  label: Text("Camera"),
                ),*/
                /*FlatButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () => {
                    pickImage(ImageSource.gallery),
                  },
                  label: Text("Gallery"),
                ),*/
              ],
            )
          ],
        ));
  }

  File? image;
  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    //final imageTemporary = File(image.path);
    final imagePermanent = await saveImagePermanently(image.path);
    setState(() => this.image = imagePermanent);
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
