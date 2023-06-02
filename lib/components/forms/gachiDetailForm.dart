import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gachi/pages/postDetailPage.dart';

import '../../attributes/colors.dart';


/* 모집글 상세 정보 관련 위젯 */
Widget gachiDetailBox(BuildContext context, String title, String detail, String gender, int numOfPeople, String category) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.box,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /*예시 코드고, 밑에 코드 사용하면 돼요 변수는 components/variable.dart에 저장해둠. */
              text('dafdf', 28, FontWeight.w800, 15),
              text('메뉴는 채팅으로 정합시다 밥 같이 먹어요오', 18, FontWeight.w500, 20),
              text('여2남2', 15, FontWeight.w600, 5),
              text('D-Day 11am-13pm', 15, FontWeight.w600, 5),
              // Text(title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),  // 글제목
              // SizedBox(height: 15),
              // Text(detail, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),  // 글세부내용
              // SizedBox(height: 20),
              // Text('성별: $gender, 인원: $numOfPeople', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),  // gender , // 인원
              // SizedBox(height: 5),
              // Text(category, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),  // 카테고리
              // SizedBox(height: 5),

              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(width: 20),
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppColors.box2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Spacer(),
                    // Text('3/4', style: AppTextStyles.sub1Style)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/*    참여자  or 참여대기자 선택 탭창     */
Widget gachiOptionBox(TabController tabController) {
  return Theme(
    data: ThemeData(
      tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.grey,  // 원래 글자 색은 grey
          labelColor: Colors.black,  // 선택하면 검정색으로 바뀜!
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          indicator: UnderlineTabIndicator(borderSide: BorderSide(style: BorderStyle.none))  // 밑에 언더라인 제거
      ),
    ),
    child: TabBar(
      controller: tabController,
      tabs: const <Widget>[
        Tab(
          text: '참여자',
        ),
        Tab(
          text: '참여 대기자',
        ),
      ],
    ),
  );
}

/*  그냥 참여자 모음 */
Widget peopleListBox(BuildContext context) {
  return Container(
    child: Column(
      children: [
        personListBox(context),
      ],
    ),
  );
}

/*  참여자 개인 위젯 Box - 기능 */
Widget personListBox(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    child: Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/gachi_logo.jpeg'),
                radius: 30,
              ),
            ),
            Text('닉네임'),
            Spacer(),
          ],
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: '거절',
          color: Colors.red,
          icon: Icons.cancel,
          onTap: () => print('Reject tapped'),
        ),
      ],
    ),
  );
}

/* 대기자 모음 */
Widget watingPeopleListBox(BuildContext context) {
  return Container(
    child: Column(
      children: [
        watingPersonListBox(context),
      ],
    ),
  );
}


Widget watingPersonListBox(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.9,
    child: Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/gachi_logo.jpeg'),
                radius: 30,
              ),
            ),
            Text('응애'),
            Spacer(),
            IconSlideAction(
              caption: '수락',
              icon: Icons.check,
              onTap: () => print('Accept tapped'),
            )
          ],
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: '거절',
          color: Colors.red,
          icon: Icons.cancel,
          onTap: () {
            print('Reject tapped');
          },
        ),
      ],
    ),
  );
}



/* 모집 마감 버튼 */
Widget gachiEndButton(BuildContext context, bool isClosed) {
  return Align(
    alignment: Alignment.center,
    child: Container(
      margin: const EdgeInsets.only(top:0),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.sub2Color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: () {
          //showRatingDialog(context);
          // bool isRecruitingClosed = false; // 모집마감 여부를 저장하는 변수는 gachiDetail.dart에 있음.
        },
        style: TextButton.styleFrom(
          primary: Colors.white, // This sets the text color
        ),
        child: Center(child: Text(isClosed ? '모집 중' : '모집 종료')),
      ),
    ),
  );
}