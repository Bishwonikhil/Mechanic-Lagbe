import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart' as loc;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:third_year_project/contest/AppColors.dart';

import 'dart:ui' as ui;

import 'login_screen.dart';

class SearchArea extends StatefulWidget {
  const SearchArea({Key? key}) : super(key: key);

  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  final loc.Location location = loc.Location();
  bool isIconSelected = true;
  bool _added = false;
  StreamSubscription<loc.LocationData>? _locationSub;
  late GoogleMapController _controller;

  Uint8List? userLocationIcon;
  Uint8List? mechanicLocationIcon;
  CameraPosition? userCameraPosition;

  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMarkers();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _locationSub!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //var pro = Provider.of<MapProvider>(context, listen: false);
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Car").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final data = snapshot.data;

          if (data != null && data.docs.isEmpty) {
            return const SizedBox();
          } else {
            return isIconSelected
                ? buildGoogleMap(snapshot)
                : CircularProgressIndicator();
          }
        },
      ),
    );
  }

  GoogleMap buildGoogleMap(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    print("----------------------------------");

    CustomInfoWindow(
      controller: _customInfoWindowController,
      height: 100,
      width: 200,
      offset: 35,
    );

    return GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      onCameraMove: (CameraPosition cameraPosition) {
        userCameraPosition = cameraPosition;
      },
      initialCameraPosition: const CameraPosition(
        target: const LatLng(23.798165469450982, 90.37875972986593),
        zoom: 15,
      ),
      mapType: MapType.terrain,
      markers: Set<Marker>.of(
        snapshot.data!.docs.map(
          (element) {
            return Marker(
                position: LatLng(element['lati'], element['long']),
                markerId: MarkerId(element.id),
                icon: BitmapDescriptor.fromBytes(mechanicLocationIcon!),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      //contentPadding: EdgeInsets.all(30),
                      title: Text(
                        'Mechanic Profile',
                        style: TextStyle(fontSize: 16, fontFamily: 'TitanOne'),
                      ),
                      content: Row(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                child:
                                Image.asset('assets/images/account.png'),
                                radius: 10,
                                backgroundColor: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    element['Name'],
                                    style: TextStyle(
                                        fontFamily: 'TitanOne',
                                        color: Colors.black54),
                                  )
                                ],
                              ),
                            ],
                          ),

                        ],

                      ),
                      /*Container(
                        height: 20,
                        */ /*decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),*/ /*
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  child: Image.asset('assets/images/account.png'),
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Text(element['Name'],style: TextStyle(fontFamily: 'TitanOne',color: Colors.black54),)
                              ],
                            ),
                          ],

                        ),
                      ),*/
                    ),
                  );
                }

                /*_customInfoWindowController.addInfoWindow!(
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.black,
                  ),
                  LatLng(element['Latitude'], element['Longitude']),
                );
              }*/

                );
          },
        ),
      ),
      onTap: (position) {
        _customInfoWindowController.hideInfoWindow!();
      },
      onMapCreated: (GoogleMapController controller) async {
        var conto = controller;
        _customInfoWindowController.googleMapController = conto;
        if (!_added) {
          _controller = controller;
          _added = true;
          //_onUserLocationChange(pro);
        }
      },
    );
  }

  /*Future<void> changeMyMap(MapProvider pro) async {
    await _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: userCameraPosition == null
              ? pro.userLocation == null
              ? const LatLng(24.89489077447926, 91.86879280019157)
              : LatLng(
              pro.userLocation!.latitude!, pro.userLocation!.longitude!)
              : userCameraPosition!.target,
          zoom: userCameraPosition == null ? 15 : userCameraPosition!.zoom,
          tilt: userCameraPosition == null ? 0 : userCameraPosition!.tilt,
          bearing: userCameraPosition == null ? 0 : userCameraPosition!.bearing,
        ),
      ),
    );
  }*/

  getMarkers() async {
    userLocationIcon =
        await getBytesFromAssets("assets/images/standing-up-man-.png", 100);
    mechanicLocationIcon =
        await getBytesFromAssets("assets/images/mechanic.png", 150);

    if (userLocationIcon != null && mechanicLocationIcon != null) {
      setState(() {
        isIconSelected = true;
      });
    } else {
      //return snackBar(context, "Something Went Wrong");
    }
  }

  /*Future<void> _onUserLocationChange(MapProvider pro) async {
    _locationSub = location.onLocationChanged.handleError((onError) {
      _locationSub!.cancel();
      setState(() {
        _locationSub = null;
      });
    }).listen((loc.LocationData currentLocation) async {
      pro.userLocation = currentLocation;
      if (mounted) {
        Provider.of<MapProvider>(context, listen: false).onLocationChange();
      }
      changeMyMap(pro);
    });
  }*/

  /*Future openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      //contentPadding: EdgeInsets.all(30),
      title: Text(
        'Mechanic Profile',
        style: TextStyle(fontSize: 16, fontFamily: 'TitanOne'),
      ),
      content: Container(
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  child: Image.asset('assets/images/account.png'),
                  radius: 10,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                Text('Bishwo Nikhil Paul',style: TextStyle(fontFamily: 'TitanOne',color: Colors.black54),)
              ],
            ),
          ],
        ),
      ),
    ),
  );*/

  Future<Uint8List> getBytesFromAssets(String path, int height) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
