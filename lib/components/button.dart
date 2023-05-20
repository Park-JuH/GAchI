import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

Widget button(String text, {VoidCallback? onPressed}) {
  return Align(
    alignment: Alignment.center,
    child: Container(
        margin: const EdgeInsets.all(5),
        width: 240,
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.sub2Color, borderRadius: BorderRadius.circular(25)),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            primary: Colors.white, // This sets the text color
          ),
          child: Center(child: Text(text)),
        )
    ),
  );
}

Widget pinButton(BuildContext context, String text, String route, {VoidCallback? onPressed}) {
  return Align(
    alignment: Alignment.center,
    child: Container(
      margin: const EdgeInsets.all(5),
      width: 250,
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.sub2Color, borderRadius: BorderRadius.circular(25)),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
          if (onPressed != null) {
            onPressed();
          }
        },
        style: TextButton.styleFrom(
          primary: Colors.white, // This sets the text color
        ),
        child: Center(child: Text(text)),
      ),
    ),
  );
}

// 모집자 메인 화면 '가치만들기 button'
Widget gachiMakeButton(BuildContext context, String text, String route, {VoidCallback? onPressed}){
  return Align(
    alignment: Alignment.center,
    child: Container(
        margin: const EdgeInsets.all(5),
        width: 250,
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.sub2Color, borderRadius: BorderRadius.circular(25)),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, route);
            if (onPressed != null) {
              onPressed();
            }
          },
          style: TextButton.styleFrom(
            primary: Colors.white, // This sets the text color
          ),
          child: Center(child: Text(text)),
        )
    ),
  );
}

Widget categoriesButtons(BuildContext context, {Function(String)? onRadioButtonChanged}) {
  return CustomRadioButton(
    elevation: 1.0,
    absoluteZeroSpacing: false,
    horizontal: true,
    height: 60,
    unSelectedColor: Theme.of(context).canvasColor,
    buttonLables: ['스터디', '밥', '공모전', '팀플', '담배', '대외활동', '기타'],
    buttonValues: ['스터디', '밥', '공모전', '팀플', '담배', '대외활동', '기타'],
    unSelectedBorderColor: Colors.green,
    selectedBorderColor: Colors.lightGreen,
    buttonTextStyle: ButtonTextStyle(
      selectedColor: Colors.white,
      unSelectedColor: Colors.black,
      textStyle: TextStyle(fontSize: 16),
    ),
    radioButtonValue: (categori) {
      print(categori); // categori 출력
    },
    selectedColor: AppColors.mainColor,
  );
}