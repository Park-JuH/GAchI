import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gachi/components/appbar.dart';
import 'package:gachi/pages/profileMain2.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;
  int temper = 0;
  String nick = '';

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.uid);
        print((loggedUser!.uid).runtimeType);
        getUserUid();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserUid() async {
    try {
      // Get a reference to the authenticated user's document
      DocumentReference userDocRef =
      FirebaseFirestore.instance.collection('Users').doc(loggedUser!.uid);

      // Get the document snapshot
      DocumentSnapshot userSnapshot = await userDocRef.get();
      print(userSnapshot);

      // Get field values
      if (userSnapshot.exists) {
        setState(() {
          nick = userSnapshot.get('nick');
          temper = userSnapshot.get('heart'); // 'fieldName' is the name of the field to retrieve
        });
      }
    } catch (e) {
      print('Error getting field value: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double temperD = temper.toDouble();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: profileAppbar(context),
      ),
      body: ListView(
        children: [
          profileBox(context, nick, temperD),
          profileBox2(context, '/loginHome'),
        ],

      ),
    );
  }
}


class ProfileModify extends StatelessWidget {
  const ProfileModify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
