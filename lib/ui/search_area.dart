import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_webservice/places.dart';
import 'package:third_year_project/contest/AppColors.dart';

class SearchArea extends StatefulWidget {
  const SearchArea({Key? key}) : super(key: key);

  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  String? _mapStyle;
  //final Completer<GoogleMapController> _controler = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.8949, 91.8687),
    zoom: 14.4746,
  );

  /*final List<Marker> _markers = <Marker>[
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(24.8949, 91.8687),
      infoWindow: InfoWindow(title: 'The title of the marker'),
    )
  ];*/

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
                //markers: Set<Marker>.of(_markers),

                onMapCreated: (GoogleMapController controller) {
                  myMapController = controller;
                  myMapController!.setMapStyle(_mapStyle);
                },
                initialCameraPosition: _kGooglePlex,
              ),
            ),
          ),
          buildProfileTitle(),
          buildTextFeild(),
          //buildCurrentLocationIcon(),
          //buildNotificationIcon(),
          //buildBottomSheet(),
        ],
      ),
    );
  }

  Widget buildProfileTitle() {
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
  }

  void showGoogleAutoComplete() async {
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
  }

  Widget buildTextFeild() {
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
  }

  /*Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("Error" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }*/

  /*Widget buildCurrentLocationIcon() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 10),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.my_location,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget buildNotificationIcon() {
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
  }*/
}
