import 'package:flutter/material.dart';
import 'package:gachi/pages/mainPost2.dart';

import '../components/appbar.dart';
import '../components/variable.dart';
import 'gachiDetail2.dart';

// 성별(여자,남자,혼성, 상관없음), 게시글 제목, 게시글 내용, 가치 카테고리
class gachiDetail extends StatefulWidget {
  const gachiDetail({Key? key, required GachiItem gachiItem}) : super(key: key);

  @override
  State<gachiDetail> createState() => _gachiDetailState();
}

class _gachiDetailState extends State<gachiDetail>
    with TickerProviderStateMixin {
  late final TabController _tabController; // tab (참여자 / 대기자 tabController)
  bool isRecruitingClosed = false; // 모집마감 여부를 저장하는 변수

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
        child: gachiDetailAppbar(context,'모임 종료','\loginHome'),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: [
                gachiDetailBox(
                    context, title, detail, gender, numOfPeople, category),
                Divider(thickness: 1),
                gachiOptionBox(_tabController),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      peopleListBox(context),
                      watingPeopleListBox(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 5, // bottom of the screen
              left: 0, // and left of the screen
              right: 0, // and right of the screen
              child: gachiEndButton(
                context,
                isRecruitingClosed,
              )),
        ],
      ),
    );
  }
}