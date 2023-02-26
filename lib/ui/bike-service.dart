import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:third_year_project/ui/search_bike.dart';

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
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.25,
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 50.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 20.0),
                          blurRadius: 30.0,
                          color: Colors.black12,
                        )
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: 50.0,
                        width: 200.0,
                        child: TextButton(
                          child: Text(
                            //'Tyre Servicing',
                            'tyre'.tr,
                            style:
                            TextStyle(fontFamily: 'TitanOne', fontSize: 18,color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBike()));
                          },
                        ),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22.0),
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(220.0),
                            )),
                      ),
                      Image.asset(
                        'assets/images/bike-tyre.png',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 20.0),
                          blurRadius: 30.0,
                          color: Colors.black12,
                        )
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: 50.0,
                        width: 200.0,
                        child: TextButton(
                          child: Text(
                            //'Body Work',
                            'body'.tr,
                            style:
                            TextStyle(fontFamily: 'TitanOne', fontSize: 18,color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBike()));
                          },
                        ),
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22.0),
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(220.0),
                            )),
                      ),
                      Image.asset(
                        'assets/images/bike-damage.png',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 20.0),
                          blurRadius: 30.0,
                          color: Colors.black12,
                        )
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: 50.0,
                        width: 200.0,
                        child: TextButton(
                          child: Text(
                            //'Car Cleaning',
                            'clean'.tr,
                            style:
                            TextStyle(fontFamily: 'TitanOne', fontSize: 18,color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBike()));
                          },
                        ),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22.0),
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(220.0),
                            )),
                      ),
                      Image.asset(
                        'assets/images/bike-wash.png',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 20.0),
                          blurRadius: 30.0,
                          color: Colors.black12,
                        )
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: 50.0,
                        width: 200.0,
                        child: TextButton(
                          child: Text(
                            //'Diagonistics',
                            'diag'.tr,
                            style:
                            TextStyle(fontFamily: 'TitanOne', fontSize: 18,color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBike()));
                          },
                        ),
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22.0),
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(220.0),
                            )),
                      ),
                      Image.asset(
                        'assets/images/bike-desig.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}