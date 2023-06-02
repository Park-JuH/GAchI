import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gachi/main.dart';

Widget text(String text, double size, FontWeight weight, double bottomSpace){
  return Column(
    children: [
      Text(text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight
      ),),
      SizedBox(
        height: bottomSpace,
      )
    ],
  );
}

Widget button(String text){
  return Container(
      margin: const EdgeInsets.all(5),
      width: 350,
      height: 50,
      decoration:
      BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),
      child: Center(child: Text(text))
  );
}

class postDetail extends StatefulWidget {
  postDetail({Key? key, required this.title}) : super(key: key);

  String title;
  @override
  State<postDetail> createState() => _postDetailState();
}

class _postDetailState extends State<postDetail> {
  dynamic selected;
  var heart = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(Icons.keyboard_arrow_left,size: 35,),
                      const SizedBox(width: 10,),
                      Image.asset(
                        'assets/images/gachi_removebg.png',
                        width: 130,
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    // text / fontSize / fontWeight / bottomSpace
                    text(title, 28, FontWeight.w800, 15),
                    text('메뉴는 채팅으로 정합시다 밥 같이 먹어요오', 18, FontWeight.w500, 20),
                    text('여2남2', 15, FontWeight.w600, 5),
                    text('D-Day 11am-13pm', 15, FontWeight.w600, 5),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 140,
                      child: const Center(
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/gachi_logo.jpeg'),
                          radius: 70,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                text('허니비',18, FontWeight.w600, 0), //username
                const SizedBox(
                  height: 20,
                ),
                button('채팅하기'),
                button('가치'),
                const SizedBox(height: 120,)
              ],
            ),
          )

        ],
      ),
      extendBody: true,
    );
  }
}

