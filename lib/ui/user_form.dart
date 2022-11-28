import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('User Screen here'),
      ),
    );
  }
}





/*
Padding(
padding: EdgeInsets.all(15),
child: Container(
child: FittedBox(
child: Material(
color: AppColors.deep_orange,
elevation: 15,
borderRadius: BorderRadius.circular(24),
shadowColor: Color(0x808196F3),
child: Column(
children: [
Container(
//height: 550,
//width: 450,
child: ClipRRect(
borderRadius: new BorderRadius.circular(15),
child: Image(
fit: BoxFit.contain,
alignment: Alignment.topRight,
image: NetworkImage(
'https://images.pexels.com/photos/305070/pexels-photo-305070.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',),
height: 250,
),
),
),
SizedBox(height: 5,),
Text('Car',style: TextStyle(fontSize: 35),),
],
),
),
),
),
),
Padding(
padding: EdgeInsets.all(15),
child: Container(
child: FittedBox(
child: Material(
color: AppColors.deep_orange,
elevation: 15,
borderRadius: BorderRadius.circular(24),
shadowColor: Color(0x808196F3),
child: Column(
children: [
Container(
//height: 550,
width: 500,
child: ClipRRect(
borderRadius: new BorderRadius.circular(15),
child: Image(
fit: BoxFit.contain,
alignment: Alignment.topRight,
image: NetworkImage('https://t3.ftcdn.net/jpg/05/33/57/46/360_F_533574629_U7E0Dx1xzwsOPFTF3EhTSh32BxAiDGzj.jpg'),
height: 350,
width: 350,

),
),
),
SizedBox(height: 2,),
Text('Truck',style: TextStyle(fontSize: 40),),
],
),
),
),
),
),

Padding(
padding: EdgeInsets.all(15),
child: Container(
child: FittedBox(
child: Material(
color: AppColors.deep_orange,
elevation: 15,
borderRadius: BorderRadius.circular(24),
shadowColor: Color(0x808196F3),
child: Column(
children: [
Container(
//height: 550,
width: 500,
child: ClipRRect(
borderRadius: new BorderRadius.circular(15),
child: Image(
fit: BoxFit.contain,
alignment: Alignment.topRight,
image: NetworkImage('https://media.istockphoto.com/id/1189925691/photo/setra-s519hd.jpg?s=612x612&w=0&k=20&c=306VUyVDmK2TY3Qw9xCRtWwranpfgAvXxi25wbe5egs='),
height: 350,
width: 350,

),
),
),
SizedBox(height: 2,),
Text('Bus',style: TextStyle(fontSize: 45),),
],
),
),
),
),
),

Padding(
padding: EdgeInsets.all(15),
child: Container(
child: FittedBox(
child: Material(
color: AppColors.deep_orange,
elevation: 15,
borderRadius: BorderRadius.circular(24),
shadowColor: Color(0x808196F3),
child: Column(
children: [
Container(
//height: 550,
width: 500,
child: ClipRRect(
borderRadius: new BorderRadius.circular(15),
child: Image(
fit: BoxFit.contain,
alignment: Alignment.topRight,
image: NetworkImage('https://s1storage.2banh.vn/image/2018/10/yamaha-r1-chat-choi-voi-phong-cach-carbon2race-7121-1539142582-5bbd73b602240.jpg'),
height: 350,
//width: 750,

),
),
),
SizedBox(height: 2,),
Text('Motor Bike',style: TextStyle(fontSize: 40),),
],
),
),
),
),
),

Padding(
padding: EdgeInsets.all(15),
child: Container(
child: FittedBox(
child: Material(
color: AppColors.deep_orange,
elevation: 15,
borderRadius: BorderRadius.circular(24),
shadowColor: Color(0x808196F3),
child: Column(
children: [
Container(
//height: 550,
width: 500,
child: ClipRRect(
borderRadius: new BorderRadius.circular(15),
child:  Image(
fit: BoxFit.contain,
alignment: Alignment.topRight,
image: NetworkImage('https://static.toiimg.com/thumb/msid-70355097,imgsize-54286,width-400,resizemode-4/70355097.jpg'),
height: 450,
//width: 750,

),
),
),
SizedBox(height: 5,),
Text('CNG',style: TextStyle(fontSize: 40),),
],
),
),
),
),
),*/
