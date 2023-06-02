import 'package:flutter/material.dart';
import 'package:gachi/attributes/texts.dart';
import 'package:gachi/pages/userAdd/userAdd.dart';
import '../button.dart';

Widget loginImageBox() {
  return Container(
    width: 200,
    height: 200,
    margin: const EdgeInsets.all(30),
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: AssetImage('assets/images/dog2.png'),
    )),
  );
}

Widget loginTextBox() {
  return const SizedBox(
    child: Column(
      children: [
        Text(
          '나랑놀자!',
          style: AppTextStyles.postTitleTextStyle,
        ),
        SizedBox(height: 10),
        Text(
          '가천대학교 가치창출앱',
          style: AppTextStyles.postSub2TextStyle,
        ),
        SizedBox(height: 30),
      ],
    ),
  );
}

Widget registerBox(BuildContext context) {
  return Container(
    child: registerbutton(context, '가입하기', '/register'),
  );
}
Widget loginBox(BuildContext context, String username, String password) {
  return Container(
    child: loginbutton(context, '로그인하기', '/',username,password),
  );
}

