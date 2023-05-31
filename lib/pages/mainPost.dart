import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gachi/components/colors.dart';

import '../components/appbar.dart';
import '../components/button.dart';
import 'mainPost2.dart';

class RescuritPage extends StatefulWidget {
  const RescuritPage({Key? key}) : super(key: key);

  @override
  State<RescuritPage> createState() => _RescuritPageState();
}

class _RescuritPageState extends State<RescuritPage> {
  late final StreamController<List<GachiItem>> _streamController;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
    fetchGachiItems();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  /* 이 함 수 안에 data 가져오면 되는듯.  */
  Future<void> fetchGachiItems() async {
    final _authentication = FirebaseAuth.instance;
    User? loggedUser;
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.uid);
      }
    } catch (e) {
      print(e);
    }
    QuerySnapshot usersSnapshot = await FirebaseFirestore.instance.collection('Posts').get();
    List<QueryDocumentSnapshot> userDocuments = usersSnapshot.docs;

    List<GachiItem> gachiItems = [];
    for (QueryDocumentSnapshot document in userDocuments) {
      if (document['uid'] == loggedUser!.uid) {
        GachiItem newItem = GachiItem(
            title: document['title'],
            state: '모집 중',
            category: document['category'],
            index: 2,
            group: document['group'],
            uid: document['uid'],
            gender: document['gender']
        );
        gachiItems.add(newItem);
      }
    }
    // add items to stream
    _streamController.add(gachiItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: rescuritappbar(),
      ),
      backgroundColor: AppColors.sub1Color,
      body: SingleChildScrollView(
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
                          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                          Text('얼른 가치를 만들어주세요! ')
                        ],
                      )
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: gachiItems.length,
                  itemBuilder: (context, index) {
                    final item = gachiItems[index];
                    return buildGachiItem(context, item);
                  },
                );
              },
            ),
            SizedBox(height: 20),
            Center(
              child: gachiMakeButton(context, '가치만들기', '/makeGachi'),
            ),
            SizedBox(height: 20),
            Center(
              child: receiveCode(context),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
