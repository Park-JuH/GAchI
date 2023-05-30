import 'package:flutter/material.dart';
import 'package:gachi/components/appbar.dart';
import 'package:gachi/components/colors.dart';
import 'package:gachi/pages/mainPost2.dart';

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

class Interesting extends StatefulWidget {
  const Interesting({Key? key}) : super(key: key);

  @override
  State<Interesting> createState() => _InterestingState();
}

class _InterestingState extends State<Interesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
        child: rescuritappbar(),
      ),
      backgroundColor: AppColors.sub1Color,
      body: ListView(
        children: <Widget>[
          buildGachiItem(context, gachiItems[1]),
          const SizedBox(
            height: 10,
          ),
          buildGachiItem(context, gachiItems[0]),
          //buildGachiItem(context, gachiItems[2]),
          //buildGachiItem(context, gachiItems[3]),
          const SizedBox(
            height: 20,
          ),

        ],
      ),
    );
  }
}

