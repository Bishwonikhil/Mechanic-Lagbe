

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:third_year_project/profile/user.dart';
//import 'package:third_year_project/ui/profile/user.dart';

class UserPreferences{
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';
  final user = UserPreferences.getUser();

  static const myUser = User(
    imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8GOhl_eN9vdeDloMffhUTzg8j8st6brprNA&usqp=CAU',
    name: 'abcdefgh',
    email: 'abcd@gmail.com',
    about: 'hjxfhjxhj',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async{
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser(){
    final json = _preferences.getString(_keyUser);
    return json == null ? myUser: User.fromJson(jsonDecode(json));
  }

}