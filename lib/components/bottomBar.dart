import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gachi/main.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../pages/mainPost.dart';

bool chk=true;
/*
* 메인화면에서 보이는 하단바.
* (4+1)개 버튼.
* */
var heart = false;
var itemList = [
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
];

class FloatingButton extends StatefulWidget {
  FloatingButton(this.getPage, {Key? key}) : super(key: key);
  Function getPage;

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: () {
        setState(() {
          chk = !chk;
          if (chk == true)
            widget.getPage(0);
          else
            widget.getPage(1);
        });
      },
      backgroundColor: Colors.white,
      child: Icon(
        chk ? Icons.person_add_alt_1_rounded : Icons.person_search_rounded,
        color: Colors.red,
      ),
    );
  }
}



class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  dynamic selected;
  double count = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StylishBottomBar(
      items: itemList,
      hasNotch: true,
      fabLocation: StylishBarFabLocation.center,
      currentIndex: selected ?? 0,
      onTap: (index) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        controller.jumpToPage(index);
        setState(() {
          selected = index;
          controller.jumpToPage(index);
        });
      },
      option: AnimatedBarOptions(
        // iconSize: 32,
        barAnimation: BarAnimation.fade,
        iconStyle: IconStyle.Default,
        // opacity: 0.3,
      ),
    );
  }
}

