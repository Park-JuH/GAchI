import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/colors.dart';
import '../components/texts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;
User? _user = _auth.currentUser;

Widget profileImage() {
  return Container(
    margin: EdgeInsets.only( top: 10,  bottom: 10),
    child: CircleAvatar(
      backgroundImage: AssetImage('assets/images/gachi_logo.jpeg'),
      radius: 70,
    ),
  );
}

Widget nickName() {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: Text(
      '앵두',                                               // 닉네임 들어가야해요!
      style: AppTextStyles.nicknameTextStyle,
    ),
  );
}

Widget profileBox(BuildContext context) {
  return Column(
    children: [
      Container(
        child: Column(
          children: [
            profileImage(),
            nickName(),
          ],
        ),
      ),
      // Divider(
      //   thickness: 1,
      // ),
      profileOndo(context)
    ],
  );
}

Widget profileOndo(BuildContext context) {
  double tempValue = 0.7; // Change this based on your temperature value

  return Container(
    margin: EdgeInsets.only(top: 20),
    child: Column(
      children: [
        //Text('꽈배기 온도'),
        SizedBox(
          height: 30, // Change this for desired thickness
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: LinearProgressIndicator(
                value: tempValue,
                backgroundColor: Colors.white70,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
              ),
            ),
          ),
        ),
        Text('꽈배기 온도 : $tempValue °C'), // Displaying temperature value
      ],
    ),
  );
}

Widget listBox(String text){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
        onPressed: () {
          // Do something when the button is pressed
        },
        child: Text(text,style: AppTextStyles.postSubTextStyle,),
      ),
    ],
  );
}

Widget profileBox2() {
  return Container(
    margin: EdgeInsets.only(top:20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(
          thickness: 0,
        ),

        listBox('활동 뱃지'),
        listBox('다크모드'),
        listBox('개발자에게 '),
        listBox('로그아웃 '),
      ],
    ),
  );
}

