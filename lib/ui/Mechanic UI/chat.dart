// import 'package:chat/add_members.dart';
// import 'package:chat/chat_room.dart';
// import 'package:chat/group_chat_screen.dart';
// import 'package:chat/methods.dart';
// import 'package:chat/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:third_year_project/contest/AppColors.dart';
import 'package:third_year_project/ui/Mechanic%20UI/chat_room.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with WidgetsBindingObserver {
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  Map<String, dynamic>? userMap;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //List list = [];

  @override
  void initstate() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    //setStatus("Online");
  }

  /*void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }*/

  @override
  /*void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //onlie
      setStatus("Online");
    } else {
      //offline
      setStatus("Offline");
    }
  }*/

  String? chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });
    await _firestore
        .collection("User")
        .where("number", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        //list = value.docs;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deep_orange,
        //title: Text("Home"),
        /*actions: [
          IconButton(
              onPressed: () => logOut(context), icon: Icon(Icons.logout)),
        ],*/
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.width / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height / 14,
                    width: size.width / 1.2,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                        hintText: "search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                ElevatedButton(
                  onPressed: onSearch,
                  child: Text("Search"),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                userMap != null
                    ? ListTile(
                      onTap: () {
                        String? roomId = chatRoomId(
                            _auth.currentUser!.displayName!,
                            userMap!["name"]);
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
                        userMap!['name'],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      subtitle: Text(userMap!['number']),
                      trailing: Icon(
                        Icons.chat,
                        color: Colors.black,
                      ),
                    )
                    : Container(),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.group),
        onPressed: () {
          /*Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ProfileScreen()),
          );*/
        },
      ),
    );
  }
}
