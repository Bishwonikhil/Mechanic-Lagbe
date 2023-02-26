
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:third_year_project/ui/splash_screen1.dart';
import 'Mechanic UI/mechanic_navigation.dart';
import 'navigation_button.dart';

class Authenticate extends StatelessWidget {
 Authenticate({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
 Map<String, dynamic>? userMap;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isUser1 = false;

  /*void check() {

    _firestore.collection('User').where('uid', isEqualTo: _auth.currentUser!.uid).get().then((value) {
      setState(() {
        userMap1 = value.docs[0].data();
        print(userMap1!["name"]);
      });
    });
  }*/
  @override
  /*Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream:
      _firestore.collection("User").doc(userMap!['uid']).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          print(userMap!["name"]);
          return SizedBox();
        } else {
          return Container();
        }
      },
    );
    *//*if(_auth.currentUser!=null){
      //if(isUser1==true){
        return const NavigationButton();
      //}else{
        return const MechanicNavigation();
      //}
    }else{
      return SplashScreen1();
    }*//*
  }*/

  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.emailVerified) {
          return const NavigationButton();
        } else {
          return SplashScreen1();
        }
      },
    );
  }
}



