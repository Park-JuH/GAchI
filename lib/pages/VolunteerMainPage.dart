import 'package:flutter/material.dart';
import 'package:gachi/components/appbar.dart';
import 'package:gachi/pages/postDetail.dart';

// 최종 편집 : 구도연
Widget listButton(String name) {
  List<String> dropdownList = [name, '1', '2'];
  String selectedDropdown = name;

  return Container(
    padding: const EdgeInsets.only(left: 7),
    width: 60,
    height: 30,
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  style: const TextStyle(fontSize: 14),
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
            const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
          size: 28,
        ),
      ),
      listButton('날짜'),
      listButton('성별'),
      listButton('가치'),
      Row(
        children: const [
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        appbar(),
        const SizedBox(
          width: 10,
        ),
        menu(),
        Container(
          width: double.infinity,
          height: 500,
          child: ListView(
            children: [
              post(context),
              post(context),
              post(context),
              post(context),
            ],
          ),
        ),
      ],
    );
  }
}

