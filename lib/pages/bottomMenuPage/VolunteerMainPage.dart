import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gachi/components/appbar.dart';
import 'package:gachi/components/colors.dart';
import 'package:gachi/pages/mainPost2.dart';
import 'package:gachi/pages/postDetail.dart';

// 최종 편집 : 김지민
Widget listButton(String name) {
  List<String> dropdownList = [name, '1', '2'];
  String selectedDropdown = name;
  return Container(
    padding: const EdgeInsets.only(left: 7),
    width: 65,
    height: 38,
    decoration: BoxDecoration(
        color: AppColors.sub2Color, borderRadius: BorderRadius.circular(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: DropdownButton(
            iconSize: 16,
            value: selectedDropdown,
            items: dropdownList.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  '$item',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              );
            }).toList(),
            onChanged: (dynamic value) {},
          ),
        ),
      ],
    ),
  );
}

Widget menu() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.all(20),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: 40,
        decoration:
            const BoxDecoration(color: AppColors.sub2Color, shape: BoxShape.circle),
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
          size: 30,
        ),
      ),
      listButton('날짜'),
      listButton('성별'),
      listButton('가치'),
      const Row(
        children: [
          Icon(
            Icons.list_rounded,
            size: 30,
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.playlist_add_check_rounded,
            size: 30,
          )
        ],
      )
    ]),
  );
}

Widget post(BuildContext context) {
  String title = '스터디 같이 하실 분';
  return InkWell(
    child: Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/gachi_logo.jpeg'),
                radius: 30,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                const Text(
                  '스터디  D-day  수  11-18시',
                  style: TextStyle(fontSize: 13),
                ),
                const Text(
                  '성별무관',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            )
          ],
        ),
      ),
    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => postDetail(title: title,)));
    },
  );
}


class VolunteerMainPage extends StatefulWidget {
  const VolunteerMainPage({Key? key}) : super(key: key);

  @override
  State<VolunteerMainPage> createState() => _VolunteerMainPageState();
}

class _VolunteerMainPageState extends State<VolunteerMainPage> {
  @override
  Widget build(BuildContext context) {
    // getCurrentUserData();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.31),
        child: Column(
          children: [
            appbar(),
            searchBox(),
            menu(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 390,
              child: ListView(
                children: [
             //     buildGachiItem_Volumnteer(context, gachiItems[1]),
                  const SizedBox(
                    height: 10,
                  ),
                  // buildGachiItem_Volumnteer(context, gachiItems[0]),
                  // buildGachiItem_Volumnteer(context, gachiItems[2]),
                  // buildGachiItem_Volumnteer(context, gachiItems[3]),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}


// Future<Object?> getCurrentUserData() async {
//   User? currentUser = FirebaseAuth.instance.currentUser;
//
//   if (currentUser != null) {
//     String uid = currentUser.uid;
//     DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(uid).get();
//
//     if (userDoc.exists) {
//       Object? userData = userDoc.data();
//       print(userData);
//       return userData;
//     } else {
//       print("현재 사용자의 문서가 존재하지 않습니다.");
//     }
//   } else {
//     print("현재 사용자가 인증되지 않았습니다.");
//   }
//
//   return null;
// }