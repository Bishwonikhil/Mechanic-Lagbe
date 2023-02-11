import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../contest/AppColors.dart';
import '../widget/customButton.dart';

class CarMechanic extends StatefulWidget {
  const CarMechanic({Key? key}) : super(key: key);

  @override
  State<CarMechanic> createState() => _CarMechanicState();
}

class _CarMechanicState extends State<CarMechanic> {

  CollectionReference users = FirebaseFirestore.instance.collection('Car');

  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _latiController = TextEditingController();
  TextEditingController _longController = TextEditingController();

  late DatabaseReference  dbRef;


  void initState(){
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Car');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/login.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 70),
              child: Text(
                'Car\n     Mechanic',
                style: TextStyle(
                    fontFamily: 'TitanOne', fontSize: 30, color: Colors.white),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'name',
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                    ),

                    SizedBox(height: 20,),
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Your workshop location',
                          labelText: 'Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _timeController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: '10am-6pm',
                          labelText: 'Time',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Sim number',
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _latiController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Latitude',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _longController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Longitude',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),

                    SizedBox(height: 20,),

                    customButton(
                      "Submit Data",
                          () async {
                        /*await users.add({
                          'Name': _nameController.text.toString(),
                          'Address': _addressController.text.toString(),
                          'Phone Number': _phoneController.text.toString(),
                          'lati': _latiController.text.toString(),
                          'long': _longController.text.toString(),
                          'time': _timeController.text.toString(),
                        }).then((value) => print('Added'));*/
                       /* var _carMap= {
                          'Name': _nameController.text.toString(),
                          'Address': _addressController.text.toString(),
                          'Phone Number': _phoneController.text.toString(),
                          'lati': _latiController.text.toString(),
                          'long': _longController.text.toString(),
                          'time': _timeController.text.toString(),
                        };
                        final int documents =  await FirebaseFirestore.instance.collection('Car').snapshots().length;
                        print('-------------------$documents');
                        //int len=documents+1;
                        await FirebaseFirestore.instance.collection('Car').doc('mechanic').set(_carMap);*/
                           /* Map<String,dynamic> car = {
                              'Name': _nameController.text,
                              'Address': _addressController.text,
                              'Phone Number': _phoneController.text,
                              'lati': _latiController.text,
                              'long': _longController.text,
                              'time': _timeController.text,
                            };
                            dbRef.push().set(car);*/
                      },
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
