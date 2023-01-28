import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:third_year_project/ui/account_screen.dart';
import 'package:third_year_project/ui/home_screen.dart';
import 'package:third_year_project/ui/more_screen.dart';
import 'package:third_year_project/ui/profile_screen.dart';
import 'package:third_year_project/ui/setting_screen.dart';

class NavigationButton extends StatefulWidget {
  const NavigationButton({Key? key}) : super(key: key);
  //int index=0;

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  int _selectedindex = 0;
  static final List<Widget> _NavScreens = <Widget>[
    HomeScreen(),
    SettingScreen(),
    MoreScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _NavScreens.elementAt(_selectedindex),
      bottomNavigationBar: GNav(
        gap: 2,
        padding: EdgeInsets.all(16),
        backgroundColor: Colors.white30,
        //color: AppColors.deep_orange,
        activeColor: Colors.black,
        tabBackgroundColor: Colors.black12,
        tabs:[
          GButton(
            icon: Icons.home,
            text: 'nHome'.tr,
          ),
          GButton(
            icon: Icons.settings,
            text: 'nSettings'.tr,
          ),
          GButton(
            icon: Icons.apps,
            text: 'nMore'.tr,
          ),
          GButton(
            icon: Icons.person,
            text: 'nAccount'.tr,
          ),
        ],
        selectedIndex: _selectedindex,
        onTabChange: (index) {
          setState(() {
            _selectedindex = index;
          });
        },
      ),
    );
  }
}
