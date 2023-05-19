import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'mainPost.dart';
import 'makeGachi2.dart';



class makeGachi extends StatelessWidget {
  final Color kDarkBlueColor = const Color(0xFF053149);

  const makeGachi({Key? key}) : super(key: key);

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
