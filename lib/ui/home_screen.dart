import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:third_year_project/ui/setting_screen.dart';

import '../contest/AppColors.dart';
import 'account_screen.dart';
import 'more_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  //int index = 0;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*int index = 0;
  static final List<Widget> _NavScreens = <Widget>[
    HomeScreen(),
    SettingScreen(),
    AccountScreen(),
    MoreScreen(),
  ];*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deep_orange,
        title: Text('Cetagory'),
        centerTitle: true,
        automaticallyImplyLeading: false,

      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              child: FittedBox(
                child: Material(
                  color: AppColors.deep_orange,
                  elevation: 15,
                  borderRadius: BorderRadius.circular(24),
                  shadowColor: Color(0x808196F3),
                  child: Column(
                    children: [
                      Container(
                        //height: 550,
                        //width: 450,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(15),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: NetworkImage(
                              'https://images.pexels.com/photos/305070/pexels-photo-305070.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            ),
                            height: 250,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Car',
                        style: TextStyle(fontSize: 35),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              child: FittedBox(
                child: Material(
                  color: AppColors.deep_orange,
                  elevation: 15,
                  borderRadius: BorderRadius.circular(24),
                  shadowColor: Color(0x808196F3),
                  child: Column(
                    children: [
                      Container(
                        //height: 550,
                        width: 500,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(15),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: NetworkImage(
                                'https://t3.ftcdn.net/jpg/05/33/57/46/360_F_533574629_U7E0Dx1xzwsOPFTF3EhTSh32BxAiDGzj.jpg'),
                            height: 350,
                            width: 350,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Truck',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              child: FittedBox(
                child: Material(
                  color: AppColors.deep_orange,
                  elevation: 15,
                  borderRadius: BorderRadius.circular(24),
                  shadowColor: Color(0x808196F3),
                  child: Column(
                    children: [
                      Container(
                        //height: 550,
                        width: 500,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(15),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: NetworkImage(
                                'https://media.istockphoto.com/id/1189925691/photo/setra-s519hd.jpg?s=612x612&w=0&k=20&c=306VUyVDmK2TY3Qw9xCRtWwranpfgAvXxi25wbe5egs='),
                            height: 350,
                            width: 350,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Bus',
                        style: TextStyle(fontSize: 45),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              child: FittedBox(
                child: Material(
                  color: AppColors.deep_orange,
                  elevation: 15,
                  borderRadius: BorderRadius.circular(24),
                  shadowColor: Color(0x808196F3),
                  child: Column(
                    children: [
                      Container(
                        //height: 550,
                        width: 500,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(15),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: NetworkImage(
                                'https://s1storage.2banh.vn/image/2018/10/yamaha-r1-chat-choi-voi-phong-cach-carbon2race-7121-1539142582-5bbd73b602240.jpg'),
                            height: 350,
                            //width: 750,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Motor Bike',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              child: FittedBox(
                child: Material(
                  color: AppColors.deep_orange,
                  elevation: 15,
                  borderRadius: BorderRadius.circular(24),
                  shadowColor: Color(0x808196F3),
                  child: Column(
                    children: [
                      Container(
                        //height: 550,
                        width: 500,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(15),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: NetworkImage(
                                'https://static.toiimg.com/thumb/msid-70355097,imgsize-54286,width-400,resizemode-4/70355097.jpg'),
                            height: 450,
                            //width: 750,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'CNG',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      /*bottomNavigationBar: GNav(
        gap: 2,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        backgroundColor: Colors.white30,
        //color: AppColors.deep_orange,
        activeColor: Colors.black,
        tabBackgroundColor: Colors.black12,
        tabs: [
          GButton(
            icon: Icons.home,
            //iconColor: Colors.lightBlue,
            //iconActiveColor: Colors.lightBlue,
            text: 'Home',
            //textColor: Colors.lightBlue,
            //backgroundColor: Colors.blueGrey,
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          ),
          GButton(
            icon: Icons.apps,
            text: 'More',
          ),
          GButton(
            icon: Icons.person,
            text: 'Account',
          ),
        ],
        selectedIndex: index,
        onTabChange: (index) {
          setState(() {
            index = index;
          });
        },
      ),*/
    );
  }
}
