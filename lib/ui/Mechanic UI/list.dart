import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:third_year_project/ui/Mechanic%20UI/chat_room.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = true;
  Map<String, dynamic>? userMap;
  List groupList = [];

  @override
  void initState() {
    super.initState();
    getAvailableGroups();
  }

  String? chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void getAvailableGroups() async {
    String uid = _auth.currentUser!.uid;

    await _firestore.collection('User').where('uid', isEqualTo: _auth.currentUser!.uid).get().then((value) {
      setState(() {
        groupList = value.docs;
        userMap = value.docs[0].data();
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Users"),
      ),
      body: isLoading
          ? Container(
              height: size.height,
              width: size.width,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: groupList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    String? roomId = chatRoomId(
                        _auth.currentUser!.displayName!, userMap!["name"]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatRoom(
                          chatRoomId: roomId,
                          userMap: userMap,
                        ),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.account_box,
                    color: Colors.black,
                  ),
                  title: Text(
                    groupList[index]['name'],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Text(groupList[index]['number']),
                  trailing: Icon(
                    Icons.chat,
                    color: Colors.black,
                  ),
                  //title: Text(groupList[index]['name']),
                );
              }),
    );
  }
}
