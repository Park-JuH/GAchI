import 'package:flutter/material.dart';

class NickName extends StatefulWidget {
  const NickName({Key? key}) : super(key: key);

  @override
  State<NickName> createState() => _NickNameState();
}

class _NickNameState extends State<NickName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100,),
                  Container(margin: const EdgeInsets.symmetric(horizontal: 20), height: 100, child: Text('닉네임을 입력하세요', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),),),

                ],
              ),
              SizedBox(height: 100,),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: const TextField()),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 200,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Gachi에서 사용할 이름이에요!\n7자 이하로 설정해주세요'),
                      ElevatedButton(onPressed: (){}, child: Text('다음'))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
