import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BusService extends StatefulWidget {
  const BusService({Key? key}) : super(key: key);

  @override
  State<BusService> createState() => _BusServiceState();
}

class _BusServiceState extends State<BusService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bus Services',style: TextStyle(fontFamily: 'TitanOne',),),
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
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlHFjmyZpM_8NUUBu5XBafiS9lRi9kLCUkzg&usqp=CAU',
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
                                'https://previews.123rf.com/images/honeyflavour/honeyflavour1901/honeyflavour190100706/115617629-cartoon-scene-with-garage-mechanic-working-repairing-some-vehicle-police-car-or-cleaning-work-place-.jpg'),
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
                                'https://play-lh.googleusercontent.com/gcnRLLNUoy7ZYenJ55FaJrVUFTRjPew9eRqplqyyzah3ZtIZFy069HJUAdEekflBxj4'
                            ),
                            iconSize: 100,
                          ),
                          Text(
                            'Bus Cleaining',
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
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7-KMz8UudXNNbID8W7GjEQZo_4Plov4Uouw&usqp=CAU'),
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
