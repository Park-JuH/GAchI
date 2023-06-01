import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gachi/components/appbar.dart';
import 'package:gachi/components/colors.dart';
import 'package:gachi/components/firebasePosting.dart';
import 'package:gachi/pages/mainPost2.dart';

class Interesting extends StatefulWidget {
  const Interesting({Key? key}) : super(key: key);

  @override
  State<Interesting> createState() => _InterestingState();
}

class _InterestingState extends State<Interesting> {
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
    QuerySnapshot usersSnapshot =
    await FirebaseFirestore.instance.collection('Posts').get();
    List<QueryDocumentSnapshot> userDocuments = usersSnapshot.docs;

    List<GachiItem> gachiItems = [];
    //여기서 uid를 적절한 방식으로 바꿔서 나타내면 될듯해요
    for (QueryDocumentSnapshot document in userDocuments) {
      if (document['uid'] == loggedUser!.uid) {
        GachiItem newItem = GachiItem(
            title: document['title'],
            state: '모집 중',
            category: document['category'],
            index: 2,
            group: document['group'],
            uid: document['uid'],
            gender: document['gender'],
            puid: document['puid']
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
          preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
          child: rescuritappbar(),
        ),
        backgroundColor: AppColors.sub1Color,
        body: postViewer(context, _streamController, 1)
    );
  }
}

