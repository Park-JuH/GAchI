import 'package:flutter/material.dart';
import 'package:gachi/pages/mainPost2.dart';

// 모임종료, 모집중, 모집마감
List<String> mainState = ['모임종료', '모닙중', '모집마감'];
List<String> gachiStae = ['모집중'];
Widget my_Gachi_Detail() {     // main
  return Container(
    //color: Colors.yellow,
    height: 300,
    width: 500,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/gachon1.png'),
        fit: BoxFit.cover,
      ),
    ),
  );
}