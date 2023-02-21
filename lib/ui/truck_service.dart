import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TruckService extends StatefulWidget {
  const TruckService({Key? key}) : super(key: key);

  @override
  State<TruckService> createState() => _TruckServiceState();
}

class _TruckServiceState extends State<TruckService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Truck Services',style: TextStyle(fontFamily: 'TitanOne',),),
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
                              'https://media.istockphoto.com/id/937843706/vector/truck-driver-is-repairing-car.jpg?s=612x612&w=0&k=20&c=i3zaQ59CsF2Jr6mxnKWO7fHI1K8OquPyIh4cdgF3tj4=',
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
                                'https://media.istockphoto.com/id/1421241322/vector/concept-for-truck-repair-service-mechanic-with-wrench-truck-tools-and-gears-vector.jpg?b=1&s=170667a&w=0&k=20&c=DBYkguR27OXG78dOiHsebP0XEGjL761mCyKkwn5l51I='),
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
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi22B0F6mwfgiIwlQvYuSRIy8SRugigNWItw&usqp=CAU'
                            ),
                            iconSize: 100,
                          ),
                          Text(
                            'Truck Cleaining',
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
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXAnquJTfxVwjZU5S9n97sgx4DyO9YppmRSw&usqp=CAU'),
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
