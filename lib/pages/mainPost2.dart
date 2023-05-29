import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gachi/pages/postDetail.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:pinput/pinput.dart';

import '../components/button.dart';
import '../components/colors.dart';
import '../components/pinputs.dart';
import '../components/texts.dart';
import 'gachiDetail.dart';

/*    <모집자 페이지>
      모집자 메인화면면에 들어가는 전반적인 요소들 관리하는 코드

      리스트 생성 : buildGachiItem 위젯
      초대코드 : receiveCode 위젯
*
* */

// 모임종료, 모집중, 모집마감
List<String> mainState = ['모집 중', '모집마감', '모임종료'];
List<String> gachiTitle = ['밥먹자요', '공부하자요', '코노갈분', '공모전짱먹어요'];
List<String> categories = ['목적1', '목적2', '목적3'];

class GachiItem {
  final String title; // 방제목
  final String state; // 모임상태
  final String category; // 모임 목적
  final int index;    // 혹시나 몰라 게시글 등록번호입니다. (구분용)

  GachiItem({required this.title, required this.state, required this.category, required this.index});
}

List<GachiItem> gachiItems = [
  GachiItem(
    title: gachiTitle[0], // 방제목
    state: mainState[0], // 상태 추가
    category: categories[0], // 카테고리 추가
    index: 1,
  ),
  GachiItem(
    title: gachiTitle[1], // 방제목
    state: mainState[1], // 상태 추가
    category: categories[1], // 카테고리 추가
    index: 2,
  ),
  GachiItem(
    title: gachiTitle[2], // 방제목
    state: mainState[1], // 상태 추가
    category: categories[2], // 카테고리 추가
    index: 3,
  ),
  GachiItem(
    title: gachiTitle[3], // 방제목
    state: mainState[1], // 상태 추가
    category: categories[2], // 카테고리 추가
    index: 3,
  ),
];

// 초대코드 위젯
Widget receiveCode(BuildContext context) {
  return RichText(
    text: TextSpan(
      text: '받은 초대 코드를 입력하려면 ',
      style: TextStyle(color: Colors.black),
      children: [
        TextSpan(
          text: '여기',
          style: TextStyle(
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
                        SizedBox(height: 140),
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

// Returns a widget that displays information about a GachiItem.
Widget buildGachiItem(BuildContext context, GachiItem gachiItem) {
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
    child: Container(
      height: screenHeight * 0.20,
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
                  Text(gachiItem.title, style: AppTextStyles.mainStyle),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(gachiItem.category, style: AppTextStyles.sub1Style),
                        SizedBox(width: 20),
                        Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                          decoration: BoxDecoration(
                            color: AppColors.box2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            gachiItem.state,
                            style: AppTextStyles.stateTextStyle,
                          ),
                        ),
                        Spacer(),
                        Text('3/4', style: AppTextStyles.sub1Style)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: screenWidth / 2 - 40,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/gachi_logo.jpeg'),
              radius: 38,
            ),
          ),
        ],
      ),
    ),
  );
}
