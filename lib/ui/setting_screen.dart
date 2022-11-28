import 'package:flutter/material.dart';
import 'package:third_year_project/contest/AppColors.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
        backgroundColor: AppColors.deep_orange,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.only(top: 15.0),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              /*buildAcountOption(context, 'Language'),
              buildAcountOption(context, 'Dark Mode'),
              buildAcountOption(context, 'Terms & Condition'),
              buildAcountOption(context, 'Privacy Policy'),*/

              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.g_translate),
                      Text(
                        '   Language                                  ',
                        style: TextStyle(
                            fontSize: 20,),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.dark_mode),
                      Text(
                        '   Dark Mode                                ',
                        style: TextStyle(
                            fontSize: 20,),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.beenhere),
                      Text(
                        '  Terms & Condition                  ',
                        style: TextStyle(
                            fontSize: 20,),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],

                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.policy),
                      Text(
                        '   Privacy Policy                           ',
                        style: TextStyle(
                            fontSize: 20,),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  /*GestureDetector buildAcountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_forward_ios,color: Colors.grey,),
          ],
        ),
      ),
    );
  }*/
}
