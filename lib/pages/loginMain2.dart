import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gachi/components/texts.dart';

import '../components/button.dart';

Widget loginImageBox() {
  return Container(
    width: 200,
    height: 200,
    margin: EdgeInsets.all(30),
    decoration: BoxDecoration(
        image: DecorationImage(
      image: const AssetImage('assets/images/dog2.png'),
    )),
  );
}

Widget loginTextBox() {
  return Container(
    child: Column(
      children: [
        Text(
          '나랑놀자!',
          style: AppTextStyles.postTitleTextStyle,
        ),
        const SizedBox(height: 10),
        Text(
          '가천대학교 가치창출앱',
          style: AppTextStyles.postSub2TextStyle,
        ),
        const SizedBox(height: 30),
      ],
    ),
  );
}

Widget registerBox(BuildContext context) {
  return Container(
    child: registerbutton(context, '가입하기', '/regiseter'),
  );
}
Widget loginBox(BuildContext context) {
  return Container(
    child: registerbutton(context, '로그인하기', '/'),
  );
}

