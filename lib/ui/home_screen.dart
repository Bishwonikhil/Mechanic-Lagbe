import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:third_year_project/ui/search_area.dart';
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
      body: Container(
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Carousel(
                  dotSize: 3.0,
                  dotSpacing: 8.0,
                  dotIncreasedColor: AppColors.deep_orange,
                  images: [
                    //BorderRadius.circular(10.5),
                    Image.asset(
                      'assets/images/Bike.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset('assets/images/car.webp', fit: BoxFit.cover),
                    Image.asset('assets/images/Truc.jpg', fit: BoxFit.cover),
                    Image.asset('assets/images/Bus.jpg', fit: BoxFit.cover),
                    Image.asset(
                      'assets/images/CNG.webp',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 90, top: 20),
                child: Text(
                  'Please select one!',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'TitanOne',
                      color: Colors.blueGrey),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GridView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Icon(Icons.directions_car,size: 100,color: Colors.white,),
                              IconButton(
                                onPressed: () {
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchArea(),
                                      ),
                                    );
                                  }
                                  ;
                                },
                                icon: Lottie.network(
                                    'https://assets4.lottiefiles.com/packages/lf20_wkaoqtgc.json',
                                    animate: true),
                                iconSize: 100,
                              ),
                              Text(
                                'Car',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'TitanOne',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchArea(),
                                      ),
                                    );
                                  }
                                  ;
                                },
                                icon: Lottie.network(
                                    'https://assets8.lottiefiles.com/packages/lf20_gq6yrsiw.json'),
                                iconSize: 100,
                              ),
                              Text(
                                'Truck',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'TitanOne'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchArea(),
                                      ),
                                    );
                                  };
                                },
                                icon: Lottie.network(
                                    'https://assets1.lottiefiles.com/packages/lf20_ztjvhpit.json'),
                                iconSize: 100,
                              ),
                              Text(
                                'Bike',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'TitanOne'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchArea(),
                                      ),
                                    );
                                  };
                                },
                                icon: Lottie.network(
                                    'https://assets5.lottiefiles.com/packages/lf20_fgvmiyev.json'),
                                iconSize: 100,
                              ),
                              Text(
                                'Bus',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'TitanOne'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchArea(),
                                      ),
                                    );
                                  };
                                },
                                icon: Lottie.network(
                                    'https://assets6.lottiefiles.com/packages/lf20_b1vuabda.json'),
                                iconSize: 100,
                              ),
                              Text(
                                'CNG',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'TitanOne'),
                              ),
                            ],
                          ),
                        ),
                      ],
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}