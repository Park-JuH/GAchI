import 'package:flutter/material.dart';

import '../pages/settingsMain.dart';
import 'button.dart';
import 'colors.dart';

// 메인 화면의 같은 색 상단 부분을 지정하는 코드입니다.
/*
* 수정일 : 0508
* 수정자 : 구도연
* */

Widget searchBox() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search), //검색 아이콘 추가
        contentPadding: EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: Colors.black)),
        hintText: '검색 키워드를 입력해주세요',
      ),
    ),
  );
}

Widget gachiImage() {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Image.asset(
      'assets/images/gachi_removebg.png',
      width: 150,
    ),
  );
}

Widget appbar() {
  return Container(
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                gachiImage(),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.black12,
                          shape: RoundedRectangleBorder(
                              //모서리를 둥글게
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text(
                          "내가치",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ]),
          const SizedBox(
            height: 40,
          ),
          searchBox(),
          const SizedBox(
            height: 30,
          ),
        ],
      ));
}

/*  모집자 MainPage Appbar */
Widget rescuritappbar() {
  return Container(
    height: 120,
    //color: Colors.yellow,
    child: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            gachiImage(),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.sub2Color,
                      shape: RoundedRectangleBorder(
                          //모서리를 둥글게
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "내가치",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget profileAppbar(BuildContext context) {
  return Container(
    height: 120,
    child: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // 뒤로가기 동작 추가
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10), // 아이콘 왼쪽 여백
                      child: Icon(Icons.arrow_back, size: 35), // 뒤로가기 아이콘
                    ),
                  ),
                  gachiImage(),
                ],
              ),
            ),
            Container(
              child: profileModify_button(context, '프로필수정', '/profileModify')
                ),
          ],
        ),
      ],
    ),
  );
}
