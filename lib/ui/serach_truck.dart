import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart' as loc;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:giff_dialog/giff_dialog.dart';

class SearchTruck extends StatefulWidget {
  const SearchTruck({Key? key}) : super(key: key);

  @override
  State<SearchTruck> createState() => _SearchTruckState();
}

class _SearchTruckState extends State<SearchTruck> {
  CollectionReference users = FirebaseFirestore.instance.collection('Truck');
  final auth = FirebaseAuth.instance;
  TextEditingController _bKashnbController = TextEditingController();
  TextEditingController _bKashOtpController = TextEditingController();
  TextEditingController _getAmount = TextEditingController();
  TextEditingController _getReference = TextEditingController();
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
        stream: FirebaseFirestore.instance.collection("Truck").snapshots(),
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
      //liteModeEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      //padding: EdgeInsets.all(20),
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
                    builder: (_) => NetworkGiffDialog(
                      image: Image.network(
                        'https://i.gifer.com/6iC.gif',
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        'Hello I am ' + element['Name'] + '!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      description: Text(
                          'I am a truck mechanic.I am here for to serve you. Feel free to call me ' +
                              element['Phone Number'] +
                              ' by this number between ' +
                              element['Time'] +
                              '. My workshop location is ' +
                              element['Address']+'.',textAlign: TextAlign.justify),

                      cornerRadius: 30.0,
                      onOkButtonPressed: () async {
                        final number = element['Phone Number'];
                        await FlutterPhoneDirectCaller.callNumber(number);
                      },

                      onCancelButtonPressed: () async {
                        Navigator.pop(context);

                        ///final call
                        await bkashDialog();

                        //await getAmount();


                      },

                      buttonCancelText: Text(
                        'Payment',
                        style: TextStyle(color: Colors.black),
                      ),

                      entryAnimation: EntryAnimation.topLeft,
                      buttonOkText: Text(
                        'Call',
                        style: TextStyle(color: Colors.black),
                      ),

                      //buttonOkColor: Colors.white,
                    ),
                    /*AlertDialog(
                      //contentPadding: EdgeInsets.all(30),
                      title: Text(
                        'Mechanic Profile',
                        style: TextStyle(fontSize: 16, fontFamily: 'TitanOne'),
                      ),
                      content: Container(
                        height: 100,
                        child: Column(
                          children: [
                            //mechanic's name print here
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

                            SizedBox(
                              height: 5,
                            ),
                            //mechanic's address name print here
                            Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Image.asset(
                                          'assets/images/placeholder.png'),
                                      radius: 10,
                                      backgroundColor: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          element['Address'],
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

                            SizedBox(
                              height: 5,
                            ),

                            //mechanic's phone nb print here
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      child: Image.asset(
                                          'assets/images/old-typical-phone.png'),
                                      radius: 10,
                                      backgroundColor: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          element['Phone Number'],
                                          style: TextStyle(
                                              fontFamily: 'TitanOne',
                                              color: Colors.black54),
                                        )
                                      ],
                                    ),
                                    SizedBox(width: 40,),

                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () async{
                                            final number = element['Phone Number'];
                                            await FlutterPhoneDirectCaller.callNumber(number);
                                          },
                                          icon: Icon(Icons.call,color: Colors.green,),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //shape: RoundedRectangleBorder(),

                    ),*/
                  );
                }

              /*_customInfoWindowController.addInfoWindow!(
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.black,
                  ),
                  LatLng(element['lati'], element['long']),
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

  //bKash method works here
  Future bkashDialog() => showDialog(
    builder: (context) => Dialog(
      child: Container(
        height: 350,
        color: Colors.pinkAccent.shade700,
        child: Stack(
          children: [
            //this container for bkash logo
            Container(
              height: 80,
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bkash_payment_logo.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            //SizedBox(height: 20,),

            Positioned(
              top: 90,
              left: 40,
              child: Container(
                //height: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your bkash account number',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            Padding(
              padding: EdgeInsets.only(top: 120, right: 40, left: 40),
              child: Container(
                height: 50,
                color: Colors.white,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  maxLength: 14,
                  controller: _bKashnbController,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(left: 5),
                    hintText: "e.g +8801XXXXXXXXX",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFBBBBBB),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
                padding: EdgeInsets.only(top: 190, left: 80),
                child: Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () async {
                      auth.verifyPhoneNumber(
                          phoneNumber: _bKashnbController.text,
                          verificationCompleted: (_) {},
                          verificationFailed: (e) {
                            Fluttertoast.showToast(
                              msg: '' + e.toString(),
                            );
                          },
                          codeSent: (String verificationID, int? token) {
                            bKashOTP(verificationID: verificationID);

                          },
                          codeAutoRetrievalTimeout: (e) {
                            Fluttertoast.showToast(
                              msg: '' + e.toString(),
                            );
                          });
                      //procceed();
                      await bKashOTP(verificationID: 'verificationID');
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Procceed',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.shade700,
                      elevation: 3,
                    ),
                  ),
                )),

            Padding(
                padding: EdgeInsets.only(top: 240, left: 90),
                child: Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.shade700,
                      elevation: 3,
                    ),
                  ),
                )),

            Padding(
              padding: EdgeInsets.only(top: 300),
              child: BackButton(
                color: Colors.white,
                onPressed: () {},
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 310, left: 200),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.pinkAccent.shade700,
                backgroundImage: const NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/159/159832.png'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 295, left: 220),
              child: TextButton(
                child: const Text(
                  '16247',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('16247');
                },
              ),
            ),
          ],
        ),
      ),
    ),
    context: context,
    //builder: (BuildContext context) {},
  );


  Future bKashOTP({required String verificationID}) => showDialog(
    builder: (context) => Dialog(
      child: Container(
        height: 350,
        color: Colors.pinkAccent.shade700,
        child: Stack(
          children: [
            //this container for bkash logo
            Container(
              height: 80,
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bkash_payment_logo.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            //SizedBox(height: 20,),

            Positioned(
              top: 90,
              left: 40,
              child: Container(
                //height: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your bkash account OTP',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            Padding(
              padding: EdgeInsets.only(top: 120, right: 40, left: 40),
              child: Container(
                height: 30,
                color: Colors.white,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  //maxLength: 11,
                  controller: _bKashOtpController,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(left: 5),
                    hintText: " bKash Verification Code",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFBBBBBB),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
                padding: EdgeInsets.only(top: 170, left: 80),
                child: Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () async {
                      final credential = PhoneAuthProvider.credential(
                        verificationId: verificationID,
                        smsCode: _bKashOtpController.text.toString(),
                      );
                      try {
                        await auth.signInWithCredential(credential);
                        await getAmount();
                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'Procceed',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.shade700,
                      elevation: 3,
                    ),
                  ),
                )),

            /*Padding(
                  padding: EdgeInsets.only(top: 210, left: 65),
                  child: Container(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () async {
                        //await bKashOTP();
                      },
                      child: Text(
                        'Resend Code',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent.shade700,
                        elevation: 3,
                      ),
                    ),
                  ),
                ),*/

            Padding(
                padding: EdgeInsets.only(top: 220, left: 90),
                child: Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.shade700,
                      elevation: 3,
                    ),
                  ),
                )),

            Padding(
              padding: EdgeInsets.only(top: 300),
              child: BackButton(
                color: Colors.white,
                onPressed: () {},
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 310, left: 200),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.pinkAccent.shade700,
                backgroundImage: const NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/159/159832.png'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 295, left: 220),
              child: TextButton(
                child: const Text(
                  '16247',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('16247');
                },
              ),
            ),
          ],
        ),
      ),
    ),
    context: context,
    //builder: (BuildContext context) {},
  );

  Future getAmount() => showDialog(
    builder: (context) => Dialog(
      child: Container(
        height: 350,
        color: Colors.pinkAccent.shade700,
        child: Stack(
          children: [
            //this container for bkash logo
            Container(
              height: 80,
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bkash_payment_logo.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            //SizedBox(height: 20,),

            Positioned(
              top: 90,
              left: 40,
              child: Container(
                //height: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Enter Amount',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            Padding(
              padding: EdgeInsets.only(top: 120, right: 40, left: 40),
              child: Container(
                height: 30,
                color: Colors.white,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  //maxLength: 11,
                  controller: _getAmount,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(left: 5),
                    hintText: " Service Charge",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFBBBBBB),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 150,
              left: 40,
              child: Container(
                //height: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Reference',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 170, right: 40, left: 40),
              child: Container(
                height: 30,
                color: Colors.white,
                child: TextField(
                  textAlign: TextAlign.center,
                  //keyboardType: TextInputType.number,
                  //maxLength: 11,
                  controller: _getReference,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(left: 5),
                    hintText: " Mechanic's number",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFBBBBBB),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 210, left: 80),
              child: Container(
                height: 30,
                child: ElevatedButton(
                  onPressed: () async {
                    var getAmount = _getAmount.text.toString();
                    var getRef = _getReference.text.toString();
                    var amount = int.parse(getAmount);
                    //var number = int.parse(getAmount);
                    FirebaseFirestore.instance
                        .collection('Payment')
                        .add({'Bill': amount,'Number': getRef}).then(
                            (value) => print("Added Amount"));
                    await users.add({
                      'Bill': _getAmount,
                    }).then((value) => print('Added Bill'));
                    Fluttertoast.showToast(msg: "Payment Successful.");
                    Navigator.pop(context);
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationButton()));
                    //paymentSeccessful();
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent.shade700,
                    elevation: 3,
                  ),
                ),
              ),
            ),


            Padding(
                padding: EdgeInsets.only(top: 250, left: 90),
                child: Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.shade700,
                      elevation: 3,
                    ),
                  ),
                )),

            Padding(
              padding: EdgeInsets.only(top: 300),
              child: BackButton(
                color: Colors.white,
                onPressed: () {},
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 310, left: 200),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.pinkAccent.shade700,
                backgroundImage: const NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/159/159832.png'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 295, left: 220),
              child: TextButton(
                child: const Text(
                  '16247',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('16247');
                },
              ),
            ),
          ],
        ),
      ),
    ),
    context: context,
    //builder: (BuildContext context) {},
  );

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
