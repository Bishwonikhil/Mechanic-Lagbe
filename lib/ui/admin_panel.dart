import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'admin_car.dart';
import 'insert_bike_mechanic.dart';
import 'insert_bus_mechanic.dart';
import 'insert_car_mechanic.dart';
import 'insert_cng_mechanic.dart';
import 'insert_truck_mechanic.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanic Panel',style: TextStyle(fontFamily: 'TitanOne',),),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,

      ),
      body: Container(
        padding: EdgeInsets.only(top: 70),
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: SizedBox(
            height: double.infinity,
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
                                  builder: (context) => InsertCar(),
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
                          //'car'.tr,
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
                                builder: (context) => InsertTruck(),
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
                          //'truck'.tr,
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
                                builder: (context) => InsertBike(),
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
                          //'bike'.tr,
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
                                builder: (context) => InsertBus(),
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
                          //'bus'.tr,
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
                                builder: (context) => InsertCng(),
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
                          //'cng'.tr,
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
      )
    );
  }
}
