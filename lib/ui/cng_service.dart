import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CNGService extends StatefulWidget {
  const CNGService({Key? key}) : super(key: key);

  @override
  State<CNGService> createState() => _CNGServiceState();
}

class _CNGServiceState extends State<CNGService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CNG Services',style: TextStyle(fontFamily: 'TitanOne',),),
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
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZEeRZvbGTXdWbrGsR4L4p6kW-EDB5VoqKBw&usqp=CAU',
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
                                'https://i.ytimg.com/vi/_5loUn_rPqg/maxresdefault.jpg'),
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
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtjF5T23za2t1p8JVS4V8MC04QmGwpBf4daQ&usqp=CAU'
                            ),
                            iconSize: 100,
                          ),
                          Text(
                            'CNG Cleaining',
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
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKmzMBMzOPGSaxkmvRdftd8AXirTn_Y6GU9A&usqp=CAU'),
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
