import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../contest/AppColors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deep_orange,
        title: Text('Cetagory'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Card(
            
          )
        ],
      ),
      bottomNavigationBar: GNav(
        gap: 2,
        padding: EdgeInsets.all(16),
        backgroundColor: Colors.white30,
        //color: AppColors.deep_orange,
        activeColor: Colors.black,
        tabBackgroundColor: Colors.black12,
        tabs: const [
          GButton(icon: Icons.home,text: 'Home',),
          GButton(icon: Icons.settings,text: 'Settings',),
          GButton(icon: Icons.apps,text: 'More',),
          GButton(icon: Icons.person,text: 'Account',),
        ],
      ),
    );
  }
}
