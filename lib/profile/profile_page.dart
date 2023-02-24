import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third_year_project/profile/button_widget.dart';
import 'package:third_year_project/profile/edit_profile_page.dart';
import 'package:third_year_project/profile/profile_widget.dart';
import 'package:third_year_project/profile/user.dart';
import 'package:third_year_project/profile/user_preferences.dart';
/*import 'package:third_year_project/ui/profile/button_widget.dart';
import 'package:third_year_project/ui/profile/edit_profile_page.dart';
import 'package:third_year_project/ui/profile/profile_widget.dart';
import 'package:third_year_project/ui/profile/user.dart';
import 'package:third_year_project/ui/profile/user_preferences.dart';*/
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final icon = CupertinoIcons.moon_stars;
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    return Scaffold(
      appBar: AppBar(

        title: Text('Profile'),
        // leading: BackButton(),
        //   backgroundColor: Colors.red,
        // elevation: 0,
        // actions: [
        //   IconButton(
        //   icon: Icon(icon),
        //     onPressed: (){},
        //   ),
        // ],
        centerTitle: true,
        backgroundColor: Colors.redAccent,


      ),


      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              await Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => EditProfilePage())
              );
              setState(() {

              });
            },
          ),

          const SizedBox(height: 24),
          buildName(user),

          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),

          const SizedBox(height: 48),
          buildAbout(user),

        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),

      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );

  Widget  buildUpgradeButton() => ButtonWidget(
    text: 'Upgrade Profile',
    onClicked: (){
      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => EditProfilePage()));
    },
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal:48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          user.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );

}
