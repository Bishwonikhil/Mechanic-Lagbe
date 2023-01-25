import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import '../contest/AppColors.dart';

Widget DecisionButton(String icon,String text,Function opPressed,double width,{double height = 50}){
return InkWell(
  onTap: ()=> opPressed(),
  child: Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 2,
          spreadRadius: 1,
        )
      ]
    ),
    child: Row(
      children: [
        Container(
          width: 65,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.deep_orange,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8),)
          ),
          child: Center(
            child: Image.asset(icon,width: 30,),
          ),
        ),
        Expanded(child: Text(text,style: TextStyle(color: Colors.black,),textAlign: TextAlign.center,)),
      ],
    ),
  ),
);
}