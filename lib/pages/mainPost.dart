import 'package:flutter/material.dart';
import 'package:gachi/components/colors.dart';

import '../components/appbar.dart';
import '../components/bottomBar.dart';
import '../components/button.dart';
import 'mainPost2.dart';

/*    <모집자 페이지>
      모집자 메인화면임.
      모집자 main 화면 코드  : 자기가 만든 모임(가치) 상태 확인
      ◆ list 관련 코드  자세한 코드는 mainPost2.dart에 있음
      주요코드 :
          buildGachiItem(context, gachiItems[1]),
          SizedBox(
            height: 10,
          ),
          buildGachiItem(context, gachiItems[0]),
          //buildGachiItem(context, gachiItems[2]),
          //buildGachiItem(context, gachiItems[3]),

*
* */

class RescuritPage extends StatefulWidget {
  const RescuritPage({Key? key}) : super(key: key);

  @override
  State<RescuritPage> createState() => _RescuritPageState();
}

class _RescuritPageState extends State<RescuritPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.3),
        child: appbar(),
      ),
      backgroundColor: AppColors.sub1Color,
      body: ListView(
        children: <Widget>[
          buildGachiItem(context, gachiItems[1]),
          SizedBox(
            height: 10,
          ),
          buildGachiItem(context, gachiItems[0]),
          //buildGachiItem(context, gachiItems[2]),
          //buildGachiItem(context, gachiItems[3]),
          SizedBox(
            height: 20,
          ),
          Center(
            child: gachiMakeButton(context, '가치만들기', '/makeGachi')
          ),
          Center(
            child: receiveCode(context),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
