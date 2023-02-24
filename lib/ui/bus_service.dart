import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:third_year_project/ui/search_bus.dart';

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
                            'Tyre Servicing',
                            style:
                            TextStyle(fontFamily: 'TitanOne', fontSize: 18,color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBus()));
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
                        'assets/images/bus-tyre.png',
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
                            'Body Work',
                            style:
                            TextStyle(fontFamily: 'TitanOne', fontSize: 18,color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBus()));
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
                        'assets/images/bus-damage.png',
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
                            'Car Cleaning',
                            style:
                            TextStyle(fontFamily: 'TitanOne', fontSize: 18,color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBus()));
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
                        'assets/images/bus-wash.png',
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
                            'Diagonistics',
                            style:
                            TextStyle(fontFamily: 'TitanOne', fontSize: 18,color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchBus()));
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
                        'assets/images/bus-in-reparation.png',
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