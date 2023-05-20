import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'mainPost.dart';
import 'makeGachi2.dart';

/*    <모집자 페이지>
      가치만들기(생성)  메인 코드
*       1. 첫번째 화면 : Select_Datail(화면)
*       2. 두번째 화면 :  Select_Category(화면), buildSlider(위젯)
*       3. 세번째 화면 : Last_Step(화면)

        주요코드
      pageBodies: [
        Select_Category(),
        SafeArea(child: Select_Detail(),),
        SafeArea(child :Last_Step(), ),
      ],

      background Image가 필요없어도 안 넣으면 패키지 특성상, 오류남.
      그래서 height 0으로 설정(보이지 않기위해)
*
* */

class MakeGachi extends StatelessWidget {
  final Color kDarkBlueColor = const Color(0xFF053149);

  const MakeGachi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: '가치만들기',
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: Colors.green,

      ),
      onFinish: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const RescuritPage(),
          ),
        );
      },
      background: [
        Image.asset('assets/images/dog2.png', height: 0),
        Image.asset('assets/images/dog2.png', height: 0),
        Image.asset('assets/images/dog2.png', height: 0),
      ],
      controllerColor: kDarkBlueColor,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      speed: 1.8,
      pageBodies: [
        Select_Category(),
        SafeArea(child: Select_Detail(),),
        SafeArea(child :Last_Step(), ),
      ],
    );
  }
}
