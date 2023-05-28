import 'package:flutter/material.dart';
import 'package:gachi/components/userAddForm.dart';
import 'package:gachi/pages/loginMain.dart';

class NickName extends StatefulWidget {
  const NickName({Key? key}) : super(key: key);

  @override
  State<NickName> createState() => _NickNameState();
}

class _NickNameState extends State<NickName> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userAddForm(0, ' 닉네임을 입력하세요', 'Gachi에서 사용할 이름이에요!\n7자 이하로 설정해주세요', '닉네임을 입력해주세요', 7, const ID()),
    );
  }
}

class ID extends StatefulWidget {
  const ID({Key? key}) : super(key: key);

  @override
  State<ID> createState() => _IDState();
}

class _IDState extends State<ID> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userAddForm(1, ' 아이디를 입력하세요', 'GachI에서 사용할 고유한 아이디에요\n한 번 만들면 바꿀 수 없어요', '아이디 입력', 15, const Password()),
    );
  }
}

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userAddForm(2, ' 비밀번호를 입력하세요', '문자, 숫자, 특수문자를 포함해\n 8-20자로 만들어주세요!', '비밀번호를 입력해주세요', 20, const ResidentNum()),
    );
  }
}

class ResidentNum extends StatefulWidget {
  const ResidentNum({Key? key}) : super(key: key);

  @override
  State<ResidentNum> createState() => _ResidentNumState();
}

class _ResidentNumState extends State<ResidentNum> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userAddForm(3, ' 주민번호를 입력하세요', 'GachI는 사용자의 개인정보를\n안전하게 보호하고 있어요', '주민번호 입력', 20, const CheckGachon()),
    );
  }
}

class CheckGachon extends StatefulWidget {
  const CheckGachon({Key? key}) : super(key: key);

  @override
  State<CheckGachon> createState() => _CheckGachonState();
}

class _CheckGachonState extends State<CheckGachon> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userAddForm(4, ' 가천대생이 맞나요?', '가천대 스마트캠퍼스 어플에서 모바일\n학생증을 캡처 후 업로드해주세요!', '', 20, const LoginMainPage()),
    );
  }
}
