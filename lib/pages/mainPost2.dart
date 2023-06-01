import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:pinput/pinput.dart';
import '../components/button.dart';
import '../components/colors.dart';
import '../components/pinputs.dart';
import '../components/texts.dart';
import 'gachiDetail.dart';
bool heart = false;

/*    <모집자 페이지>
      모집자 메인화면면에 들어가는 전반적인 요소들 관리하는 코드

      리스트 생성 : buildGachiItem 위젯
      초대코드 : receiveCode 위젯
*
* */

// 모임종료, 모집중, 모집마감
List<String> mainState = ['모집 중', '모집마감', '모임종료'];

class GachiItem {
  final String title; // 방제목
  final String state; // 모임상태
  final String category; // 모임 목적
  final int index;    // 혹시나 몰라 게시글 등록번호입니다. (구분용)
  final int group;
  final String uid;
  final String gender;
  final String puid;

  GachiItem({
    required this.title,
    required this.state,
    required this.category,
    required this.index,
    required this.group,
    required this.uid,
    required this.gender,
    required this.puid,
  });
}

/* 데이터가 업데이트 할때마다 UI를 업데이트하는 함수  */
Widget buildGachiItems(BuildContext context, Stream<List<GachiItem>> gachiStream, int pageNum) {
  return StreamBuilder<List<GachiItem>>(
    stream: gachiStream,
    builder: (BuildContext context, AsyncSnapshot<List<GachiItem>> snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      return ListView(
        children: snapshot.data!.map((gachiItem) {
          return buildGachiItem(context, gachiItem, pageNum);
        }).toList(),
      );
    },
  );
}


/*
          모집자가 쓰는 buildGachiItem  < 하트 없 버전 >

*/
// Returns a widget that displays information about a GachiItem.
Widget buildGachiItem(BuildContext context, GachiItem gachiItem, int pageNum) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => gachiDetail(gachiItem: gachiItem),      // 클릭하면 gachi 상세 페이지(모집자 기준)으로 넘어가는 창.
        ),
      );
    },
    child: Column(
      children: [
        SizedBox(
          height: screenHeight * 0.18,
          // Provide a sufficient height for the Container
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                // Align the inner Container to the bottom
                child: Container(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.box,
                  ),
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(gachiItem.title, style: AppTextStyles.mainStyle),
                          pageNum == 0 ? Heart(puid: gachiItem.puid,) : const SizedBox(height: 0,)
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(gachiItem.category, style: AppTextStyles.sub1Style),   // 목록
                            const SizedBox(width: 20),
                            Container(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                              decoration: BoxDecoration(
                                color: AppColors.box2,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                gachiItem.state,
                                style: AppTextStyles.stateTextStyle,
                              ),
                            ),
                            const Spacer(),
                            Text('모집 수 : ${gachiItem.group}', style: AppTextStyles.sub1Style)     // 사람수
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0-20,
                left: screenWidth / 2 - 40,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/gachi_logo.jpeg'),
                  radius: 38,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 30,
        )
      ],
    ),
  );
}




class Heart extends StatefulWidget {
  Heart({Key? key, this.puid}) : super(key: key);
  final puid;
  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap : (){

      print(widget.puid);
      setState(() {
        heart = !heart;
        if (heart == true)
          print("on");
        else
          print("off");
      });
    },
        child: heart == true ? const Icon(Icons.favorite_rounded, color: Colors.deepOrange) : const Icon(Icons.favorite_outline_rounded)
    );
  }
}


// 초대코드 위젯
Widget receiveCode(BuildContext context) {
  return RichText(
    text: TextSpan(
      text: '받은 초대 코드를 입력하려면 ',
      style: const TextStyle(color: Colors.black),
      children: [
        TextSpan(
          text: '여기',
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Dialogs.bottomMaterialDialog(
                // msg: ' ',
                title: '초대코드 입력',
                context: context,
                actions: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Pinput(
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          validator: (s) {
                            return s == '2222' ? null : 'Pin is incorrect';
                          },
                          pinputAutovalidateMode:
                          PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          onCompleted: (pin) => print(pin),
                        ),
                        const SizedBox(height: 140),
                        pinButton(
                          context,
                          '가치',
                          '/recruit',
                          onPressed: () {
                            print('Navigating to recruit page');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
        ),
      ],
    ),
  );
}
