import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gachi/components/rescuritAppbar.dart';
import 'package:gachi/components/colors.dart';

import '../components/bottomBar.dart';
import '../components/button.dart';
import 'mainPost2.dart';
import 'makeGachi.dart';

class RescuritPage extends StatefulWidget {
  const RescuritPage({Key? key}) : super(key: key);

  @override
  State<RescuritPage> createState() => _RescuritPageState();
}

class _RescuritPageState extends State<RescuritPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
        child: rescuritappbar(),
      ),
      backgroundColor: AppColors.sub1Color,
      body: ListView(
        children: <Widget>[
          buildGachiItem(context, gachiItems[1]),
          SizedBox(
            height: 10,
          ),
          buildGachiItem(context, gachiItems[0]),
          //buildGachiItem(context, gachiItems[2]),
          //buildGachiItem(context, gachiItems[3]),
          SizedBox(
            height: 20,
          ),
          Center(
            child: button(
              '가치만들기',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => makeGachi()),
                );
              },
            ),
          ),
          Center(
            child: receiveCode(context),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
