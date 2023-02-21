import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BikeService extends StatefulWidget {
  const BikeService({Key? key}) : super(key: key);

  @override
  State<BikeService> createState() => _BikeServiceState();
}

class _BikeServiceState extends State<BikeService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bike Services',style: TextStyle(fontFamily: 'TitanOne',),),
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
                            onPressed: () {},
                            icon: Image.network(
                              'https://cdn.dribbble.com/users/2129008/screenshots/9555476/ilustrasi_ojol_cerita-03.jpg',
                            ),//animate: true),
                            iconSize: 100,
                          ),
                          Text(
                            'Tyre Servicing',
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
                                /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchTruck(),
                              ),
                            );*/
                              }
                              ;
                            },
                            icon: Image.network(
                                'https://c8.alamy.com/zooms/6/a79de3bed7614f16bded036304cd016c/f5whmy.jpg'),
                            iconSize: 100,
                          ),
                          Text(
                            'Body Work',
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
                                /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchBike(),
                              ),
                            );*/
                              };
                            },
                            icon: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGPsE3o2I994U-DZU2iQK-sMtHfABt_1TcLw&usqp=CAU'
                            ),
                            iconSize: 100,
                          ),
                          Text(
                            'Bike Cleaining',
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
                                /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchBus(),
                              ),
                            );*/
                              };
                            },
                            icon: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9TpnDpFWRwGRCWM14nyPkC4BCVByTe47swQ&usqp=CAU'),
                            iconSize: 100,
                          ),
                          Text(
                            'Diagonistics',
                            //'bus'.tr,
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'TitanOne'),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30.0),
                    //     color: Colors.grey,
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       IconButton(
                    //         onPressed: () {
                    //           {
                    //             /*Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => SearchCNG(),
                    //           ),
                    //         );*/
                    //           };
                    //         },
                    //         icon: Lottie.network(
                    //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpbkzOgct8YYxITZvgbJxIqQefEAnIXX31Hg&usqp=CAU'),
                    //         iconSize: 100,
                    //       ),
                    //       Text(
                    //         'Servicing',
                    //         //'cng'.tr,
                    //         style: TextStyle(
                    //             fontSize: 20, fontFamily: 'TitanOne'),
                    //       ),
                    //     ],
                    //   ),
                    // ),
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
