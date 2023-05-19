import 'package:flutter/material.dart';
import 'package:gachi/components/colors.dart';

// 모집자 appbar

Widget gachiImage() {
  return Container(
    margin: const EdgeInsets.all(5),
    child: Image.asset(
      'assets/images/gachi_removebg.png',
      width: 150,
    ),
  );
}
Widget rescuritappbar() {
  return Container(
    height: 120,
    //color: Colors.yellow,
    child: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            gachiImage(),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.sub2Color,
                      shape: RoundedRectangleBorder(
                        //모서리를 둥글게
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "내가치",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

