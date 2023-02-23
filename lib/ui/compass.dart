import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class Compass extends StatefulWidget {
  const Compass({Key? key}) : super(key: key);

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {

  //first of all let's set the compass
  double? heading = 0;
  @override
  void initState(){

    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
      heading = event.heading;
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Compass"),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${heading!.ceil()}°",
            style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 50.0,
          ),

          //show the compass
          Padding(padding: EdgeInsets.all(18.0),

            child: Stack(
              alignment: Alignment.center,

              children: [
                Image.asset("assets/images/cadrant.png"),
                Transform.rotate(angle: ((heading ?? 0) * (pi / 180) * -1),
                child: Image.asset("assets/images/compass.png",
                       scale: 1.1,
                ),
                ),

              ],
            )
          ),
        ],
      ),
    );
  }
}
