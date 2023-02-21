import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CarService extends StatefulWidget {
  const CarService({Key? key}) : super(key: key);

  @override
  State<CarService> createState() => _CarServiceState();
}

class _CarServiceState extends State<CarService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Car Services',style: TextStyle(fontFamily: 'TitanOne',),),
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
                                'https://cdni.iconscout.com/illustration/premium/thumb/mechanic-garage-workers-5283478-4409724.png?f=webp',
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
                                'https://thumbs.dreamstime.com/b/car-service-having-their-repaired-cartoon-people-characters-paint-car-change-wheels-automobile-repair-shop-vehicle-service-concept-152230940.jpg'),
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
                            icon: Lottie.network(
                                'https://assets3.lottiefiles.com/packages/lf20_xvw0ldqd.json'
                            ),
                            iconSize: 100,
                          ),
                          Text(
                            'Car Cleaining',
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
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRENI13zU1CiCdcgXW1Y35yT_LVQEqWXiFJ8g&usqp=CAU'),
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
