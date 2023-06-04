import 'package:flutter/material.dart';
import 'package:gachi/components/forms/postForm.dart';
import 'package:gachi/pages/postDetailPage.dart';

import '../components/appbar.dart';
import '../attributes/variable.dart';
import '../components/forms/gachiDetailForm.dart';
import '../components/forms/profileForm.dart';
import '../main.dart';

// 성별(여자,남자,혼성, 상관없음), 게시글 제목, 게시글 내용, 가치 카테고리
class gachiDetail extends StatefulWidget {
  gachiDetail({Key? key, required this.gachiItem}) : super(key: key);
  final GachiItem gachiItem;
  @override
  State<gachiDetail> createState() => _gachiDetailState();
}

class _gachiDetailState extends State<gachiDetail>
    with TickerProviderStateMixin {
  late final TabController _tabController; // tab (참여자 / 대기자 tabController)
  bool isRecruitingClosed = false; // 모집 마감 여부를 저장하는 변수
  final String nickname = '';
  late final double temper;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this,
        length: pageNum == 0
            ? 1
            : 2); // if pageNum == 0, then only 1 tab else 2 tabs
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
        child: gachiDetailAppbar(context, pageNum == 0 ? '신고하기' : '가치 삭제'),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: [
                gachiDetailBox(
                    context, widget.gachiItem),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    profileOndo(context, 36),
                 //   profileOndo(context, temper), // 게시글 올린사람의 꽈배기 온도가 들어가야해요!
                  ],
                ),
                Divider(thickness: 1),
                gachiOptionBox(_tabController, pageNum),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    controller: _tabController,
                    children: pageNum == 0
                        ? [peopleListBox(context, pageNum)]
                        : [
                            peopleListBox(context, pageNum),
                            watingPeopleListBox(context)
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
                pageNum,
              )),
        ],
      ),
    );
  }
}
