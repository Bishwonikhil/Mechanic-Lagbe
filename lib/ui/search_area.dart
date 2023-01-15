import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchArea extends StatefulWidget {
  const SearchArea({Key? key}) : super(key: key);


  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {

  late GoogleMapController googleMapController;
  static const CameraPosition  initialCameraPosition = CameraPosition(target: LatLng(37.42796133580664, -122.0857449655962), zoom: 14);
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User current location"),
        centerTitle: true,
      ),
      body: GoogleMap(initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
          googleMapController = controller;
        },),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{

          Position position = await _determinePosition();
          googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude,position.longitude), zoom: 14)));

          markers.clear();
          markers.add(Marker(markerId:const MarkerId('CurrentLocation'),position: LatLng(position.latitude, position.longitude)));
          setState(() {});
        },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history),
      ),
    );
  }



  Future<Position> _determinePosition() async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error("Location services are disabled");
    }

    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();

      if(permission == LocationPermission.denied){
        return Future.error("Location permission denied");
      }
    }

    if(permission == LocationPermission.deniedForever){
      return Future.error("Location permission are permanently denied");
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;

  }
}














/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_webservice/places.dart';
import 'package:third_year_project/contest/AppColors.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:google_maps_webservice/src/core.dart';


class SearchArea extends StatefulWidget {
  const SearchArea({Key? key}) : super(key: key);

  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng? _latLng = LatLng(28.6472799, 76.8130638);

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.6289206,77.2065322),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    _latLng = LatLng(_locationData.latitude!, _locationData.longitude!);
    print(_latLng);

    _kGooglePlex = CameraPosition(
      target: _latLng!,
      zoom: 14.4746,
    );

    await Future.delayed(const Duration(seconds: 1));
    final GoogleMapController controller = await _controller.future;
    setState((){
      controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
    });
  }

  @override
  initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: <Marker>{_setMarker()},
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: Text('To the lake!'),
          icon: Icon(Icons.directions_boat),
        ),
      ),
    );
  }

  _setMarker() {
    return Marker(
      markerId: MarkerId("marker_1"),
      icon: BitmapDescriptor.defaultMarker,
      position: _latLng!,
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}*/

/*class SearchArea extends StatefulWidget {
  const SearchArea({Key? key}) : super(key: key);

  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  String? _mapStyle;
  final Completer<GoogleMapController> _controler = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.8949, 91.8687),
    zoom: 14.4746,
  );

  final List<Marker> _markers = <Marker>[
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(24.8949, 91.8687),
      infoWindow: InfoWindow(title: 'The title of the marker'),
    )
  ];

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style').then((string) {
      _mapStyle = string;
    });
  }

  GoogleMapController? myMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SafeArea(
              child: GoogleMap(
                //mapType: MapType.satellite,
                zoomControlsEnabled: false,
                markers: Set<Marker>.of(_markers),

                onMapCreated: (GoogleMapController controller) {
                  myMapController = controller;
                  myMapController!.setMapStyle(_mapStyle);
                },
                initialCameraPosition: _kGooglePlex,
              ),
            ),
          ),
          //buildProfileTitle(),
          //buildTextFeild(),
          buildCurrentLocationIcon(),
          //buildNotificationIcon(),
          //buildBottomSheet(),
        ],
      ),
    );
  }

  *//*Widget buildProfileTitle() {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Container(
        width: Get.width,
        child: Row(
          children: [
            CircleAvatar(
              //radius: kSpacingUnit.w * 5,
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://imageio.forbes.com/specials-images/imageserve/627bd4c60412e4343323ad21/0x0.jpg?format=jpg&crop=1478,1478,x467,y0,safe&height=416&width=416&fit=bounds"),
            ),
            const SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Good morning, ',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      TextSpan(
                        text: 'Leo!',
                        style: TextStyle(
                          color: AppColors.deep_orange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Where are your location?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }*//*

  *//*void showGoogleAutoComplete() async {
    const kGoogleApiKey = "AIzaSyA0RLXyX1g2JiVfaLdtrFDH96IqcEw_Jyo";

    Prediction? p = await PlacesAutocomplete.show(
      offset: 0,
      radius: 1000,
      strictbounds: false,
      region: "us",
      language: "en",
      context: context,
      mode: Mode.overlay,
      apiKey: kGoogleApiKey,
      components: [new Component(Component.country, "us")],
      types: ["(cities)"],
      hint: "Search Area",
    );
  }*//*

  *//*Widget buildTextFeild() {
    return Positioned(
      top: 165,
      left: 20,
      right: 20,
      child: Container(
        width: Get.width,
        height: 50,
        padding: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 20,
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          readOnly: true,
          onTap: () {
            showGoogleAutoComplete();
          },
          decoration: InputDecoration(
            hintText: 'Search Location',
            hintStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFFBBBBBB),
              //color: Colors.black,
              //fontFamily: 'TitanOne',
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(Icons.search),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }*//*

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("Error" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  Widget buildCurrentLocationIcon() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60, right: 10),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {0
             *//* getUserCurrentLocation().then((value) async{
                print('My Current Location');
                print(value.latitude.toString() + " " + value.longitude.toString());

                _markers.add(
                  Marker(
                      markerId: MarkerId('2'),
                      //position: LatLng(value.latitude, value.longitude),
                    position: LatLng(24.6985296,91.9408568),
                      infoWindow: InfoWindow(title: "My Current Location"),),
                );
                CameraPosition cameraPosition = CameraPosition(
                  target: LatLng(value.latitude, value.longitude),
                );
                final GoogleMapController controller = await _controler.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {

                });
              });*//*
            },
          ),
        ),
      ),
    );
  }

  *//*Widget buildNotificationIcon() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 10),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget buildBottomSheet() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: Get.width * 0.8,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
      ),
    );
  }*//*
}*/
