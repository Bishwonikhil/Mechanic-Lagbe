
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../admin_panel.dart';
import '../home_screen.dart';

class Test extends StatefulWidget {

  Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Map<String, dynamic>? userMap;
  bool isUser = true;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
      _firestore.collection('User').where('uid', isEqualTo: _auth.currentUser!.uid).get().then((value) {
        setState(() {
          userMap = value.docs[0].data();
        });
      });

      userMap!['isUser'] == true ? HomeScreen() : AdminPanel();
      return SizedBox();



  }
}






