import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gachi/components/button.dart';
import 'package:gachi/pages/mainPost2.dart';



// 파이어베이스로부터 불러온 값을을 지원자/모집자 화면에서 리스트뷰로 게시물을 보여주는 코드입니다.
// 두 페이지가 모두 이 위젯을 사용합니다.
Widget postViewer(BuildContext context, var _streamController, int pageNum){ // 0: volunteer, 1: recruiter
  return SingleChildScrollView(
    child: Column(
      children: [
        StreamBuilder<List<GachiItem>>(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final gachiItems = snapshot.data ?? [];

            if (gachiItems.isEmpty) {
              return Center(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2),
                      const Text('얼른 가치를 만들어주세요! ')
                    ],
                  ));
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: gachiItems.length,
              itemBuilder: (context, index) {
                final item = gachiItems[index];
                return buildGachiItem(context, item, pageNum);
              },
            );
          },
        ),
        pageNum == 0 ?
        const SizedBox(
          height: 0,
        ):Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: gachiMakeButton(context, '가치만들기', '/makeGachi'),
            ),
            const SizedBox(height: 20),
            Center(
              child: receiveCode(context),
            ),
            const SizedBox(height: 40),
          ],
        ),

      ],
    ),
  );
}


