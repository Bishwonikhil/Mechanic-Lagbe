import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../contest/AppColors.dart';
import 'firestore_services.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: AppColors.deep_orange,
        title: const Text("Profile"),
      ),
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirestoreServices.getUser(_auth.currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];

              return Column(
                children: [
                  //user details section

                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Image.asset('images/Profile.png',
                                height: 130, width: 130, fit: BoxFit.fill)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make(),

                        //10.widthBox,
                        30.heightBox,
                        Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: const BoxDecoration(
                                    color: Colors.blueGrey,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.account_box,
                                            color: Colors.white,
                                          ),
                                          10.widthBox,
                                          "${data['name']}"
                                              .text
                                              .minFontSize(18)
                                              .white
                                              .fontWeight(FontWeight.w500)
                                              .make(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: const BoxDecoration(
                                    color: Colors.blueGrey,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.email,
                                            color: Colors.white,
                                          ),
                                          10.widthBox,
                                          "${data['email']}"
                                              .text
                                              .minFontSize(18)
                                              .white
                                              .fontWeight(FontWeight.w500)
                                              .make(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: const BoxDecoration(
                                    color: Colors.blueGrey,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.phone,
                                            color: Colors.white,
                                          ),
                                          10.widthBox,
                                          "${data['number']}"
                                              .text
                                              .minFontSize(18)
                                              .white
                                              .fontWeight(FontWeight.w500)
                                              .make(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                //"${data['email']}".text.black.make(),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,

                  //BUTTONS
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
