import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gachi/pages/profileMain2.dart';
import 'package:gachi/pages/userAdd/userAdd.dart';

import '../components/texts.dart';
import 'loginMain2.dart';

class LoginMainPage extends StatefulWidget {
  const LoginMainPage({Key? key}) : super(key: key);

  @override
  _LoginMainPageState createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  bool isLoginBoxVisible = false; // 로그인 박스가 보이는지 여부를 결정하는 변수
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textFieldWidth = screenWidth * 0.7; // 화면 너비의 70% 계산

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loginImageBox(),
            AnimatedSize(
              duration: Duration(milliseconds: 600),
              child: Container(
                height: isLoginBoxVisible ? 100 : 0,
                child: Column(
                  children: [
                    Container(
                      width: textFieldWidth,
                      child: TextField(
                        onChanged: (value) {
                          username = value;
                        },
                        decoration: InputDecoration(hintText: '아이디'),
                      ),
                    ),
                    Container(
                      width: textFieldWidth,
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(hintText: '비밀번호'),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (!isLoginBoxVisible) loginTextBox(),
            isLoginBoxVisible ? loginBox(context,username,password) : registerBox(context),
            loginText(context),
          ],
        ),
      ),
    );
  }

  Widget loginText(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: isLoginBoxVisible ? '아직 회원이 아니신가요? ' : '이미 계정이 있나요? ',
        style: AppTextStyles.text_style,
        children: [
          TextSpan(
            text: isLoginBoxVisible ? '가입하기' : '로그인',
            style: TextStyle(
              color: Colors.green,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  isLoginBoxVisible = !isLoginBoxVisible;
                  if (!isLoginBoxVisible)
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NickName()));
                });
              },
          ),
        ],
      ),
    );
  }
}
