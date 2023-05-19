import 'package:flutter/material.dart';
import 'package:gachi/pages/mainPost2.dart';

import '../components/colors.dart';
import '../components/texts.dart';

// 모임종료, 모집중, 모집마감
List<String> mainState = ['모집 중', '모집마감', '모임종료'];
List<String> gachiTitle = ['밥먹자요', '공부하자요','코노갈분','공모전짱먹어요'];
List<String> categories = ['목적1', '목적2', '목적3'];

class GachiItem {
  final String title; // 방제목
  final String state; // 모임상태
  final String category; // 모임 목적

  GachiItem({required this.title, required this.state, required this.category});
}

List<GachiItem> gachiItems = [
  GachiItem(
    title: gachiTitle[0], // 방제목
    state: mainState[0], // 상태 추가
    category: categories[0], // 카테고리 추가
  ),
  GachiItem(
    title: gachiTitle[1], // 방제목
    state: mainState[1], // 상태 추가
    category: categories[1], // 카테고리 추가
  ),
  GachiItem(
    title: gachiTitle[2], // 방제목
    state: mainState[1], // 상태 추가
    category: categories[2], // 카테고리 추가
  ),
  GachiItem(
    title: gachiTitle[3], // 방제목
    state: mainState[1], // 상태 추가
    category: categories[2], // 카테고리 추가
  ),
];

// Returns a widget that displays information about a GachiItem.
Widget buildGachiItem(BuildContext context, GachiItem gachiItem) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return Container(
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
  );
}
