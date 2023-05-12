import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

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
  PageController controller = PageController();

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
                SizedBox(
                  height: 20,
                ),
                text('허니비',18, FontWeight.w600, 0), //username
                SizedBox(
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

      extendBody: true, //to make floating action button notch transparent

      // to avoid the floating action button overlapping behavior,
      // when a soft keyboard is displayed
      // resizeToAvoidBottomInset: false,
      // state 건드리기 싫어서 그냥 놔둘 예정입니다.
      bottomNavigationBar: StylishBottomBar(
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.house_outlined,
            ),
            selectedIcon: const Icon(Icons.house_rounded),
            selectedColor: Colors.teal,
            title: const Text('홈'),
          ),
          BottomBarItem(
            icon: const Icon(CupertinoIcons.heart),
            selectedIcon: const Icon(CupertinoIcons.heart_fill),
            selectedColor: Colors.red,
            title: const Text('관심'),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.style_outlined,
              ),
              selectedIcon: const Icon(
                Icons.style,
              ),
              selectedColor: Colors.deepOrangeAccent,
              title: const Text('채팅')),
          BottomBarItem(
              icon: const Icon(
                Icons.person_outline,
              ),
              selectedIcon: const Icon(
                Icons.person,
              ),
              selectedColor: Colors.deepPurple,
              title: const Text('프로필')),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
        option: AnimatedBarOptions(
          // iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.Default,
          // opacity: 0.3,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            heart = !heart;
          });
        },
        backgroundColor: Colors.white,
        child: Icon(
          heart ? Icons.add_sharp : Icons.add_rounded,
          color: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

