import 'package:flutter/material.dart';
import 'package:gachi/components/appbar.dart';
import 'package:gachi/components/chatting/message.dart';
import 'package:gachi/components/chatting/new_message.dart';

class Chatting extends StatefulWidget {
  const Chatting({Key? key}) : super(key: key);

  @override
  State<Chatting> createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
        child: appbar(),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Messages()),
            Column(
              children: [
                NewMessage(),
                SizedBox(height: 90,)
              ],
            )
          ],

        ),
      )
    );
  }
}
