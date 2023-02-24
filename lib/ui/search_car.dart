import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart' as loc;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:giff_dialog/giff_dialog.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:third_year_project/widget/customButton.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../contest/AppColors.dart';
import 'navigation_button.dart';
import 'package:quickalert/quickalert.dart';

class SearchCar extends StatefulWidget {
  const SearchCar({Key? key}) : super(key: key);

  @override
  State<SearchCar> createState() => _SearchCarState();
}

class _SearchCarState extends State<SearchCar> {
  CollectionReference users = FirebaseFirestore.instance.collection('Car');
  //var verificationID;
  final auth = FirebaseAuth.instance;
  TextEditingController _getAmount = TextEditingController();
  TextEditingController _getReference = TextEditingController();
  final _bKashnbController = TextEditingController();
  TextEditingController _bKashOtpController = TextEditingController();
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

  void procceed() async {
    if (_bKashnbController.text == "") return;
    var signaTureID = await SmsAutoFill().getAppSignature;
    Map sendOtpData = {
      "bKashnb": _bKashnbController.text,
      "signatureID": signaTureID,
    };
    print(sendOtpData);
  }

  /*void paymentSuccessful(){
    QuickAlert.show(
      context: context,
      text: 'Payment Successful',
      type: QuickAlertType.success,
    );
    print('Payment Successful');
  }*/

  late DatabaseReference dbRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMarkers();
    dbRef = FirebaseDatabase.instance.ref().child('Car');
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
                        'https://cdn.dribbble.com/users/207059/screenshots/16573461/media/f154d82ff06254c9d49bd8ddda1db06f.gif',
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        'Hello I am ' + element['Name'] + '!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      description: Text(
                          'I am a car mechanic.I am here for to serve you. Feel free to call me ' +
                              element['Phone Number'] +
                              ' by this number between ' +
                              element['Time'] +
                              '. My workshop location is ' +
                              element['Address'] +
                              '.',
                          textAlign: TextAlign.justify),
                      cornerRadius: 30.0,

                      onCancelButtonPressed: () async {
                        Navigator.pop(context);

                        ///final call
                        await bkashDialog();

                        //await getAmount();

                      },

                      //Call to the mechanic method in this poriton
                      onOkButtonPressed: () async {
                        final number = element['Phone Number'];
                        await FlutterPhoneDirectCaller.callNumber(number);
                      },

                      entryAnimation: EntryAnimation.topLeft,

                      //Payment method calling this portion
                      buttonCancelText: Text(
                        'Payment',
                        style: TextStyle(color: Colors.black),
                      ),

                      buttonOkText: Text(
                        'Call',
                        style: TextStyle(color: Colors.black),
                      ),

                      //buttonOkColor: Colors.white,
                    ),
                  );
                },);
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
                          /*auth.verifyPhoneNumber(
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
                              });*/
                           //procceed();
                          await bKashOTP();
                          //await bKashOTP(verificationID: 'verificationID');

                          //await bKashOTP();
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
/*{required String verificationID}*/
  Future bKashOTP() => showDialog(
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
                          /*final credential = PhoneAuthProvider.credential(
                            verificationId: verificationID,
                            smsCode: _bKashOtpController.text.toString(),
                          );
                          try {
                            Navigator.pop(context);
                            await auth.signInWithCredential(credential);
                            await getAmount();
                          } catch (e) {
                            print(e);
                          }*/
                          await getAmount();
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
                        Navigator.pop(context);
                        paymentSuccessful();
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

                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationButton()));


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
                        onPressed: () {
                          Navigator.pop;
                        },
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


  void paymentSuccessful(){
    QuickAlert.show(
      context: context,
      text: 'Payment Successful',
      type: QuickAlertType.success,
      titleColor: Colors.red,
      confirmBtnColor: Colors.cyan,
      //backgroundColor: Colors.blueGrey
    );
    print('Payment Successful');
  }
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
  );
*/
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
