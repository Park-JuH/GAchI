import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gachi/components/appbar.dart';
import 'package:gachi/components/forms/profileForm.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'dart:io';


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
  String? profileImageUrl;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        setState(() {
          loggedUser = user;
        });
        print(loggedUser!.uid);
        print((loggedUser!.uid).runtimeType);
        await getUserProfileImageUrl();
        getUserUid();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserProfileImageUrl() async {
    final userDocRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(loggedUser!.uid);

    final userSnapshot = await userDocRef.get();
    if (userSnapshot.exists) {
      setState(() {
        profileImageUrl = userSnapshot.get('profileImageUrl');
      });
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

  Future<void>  _changeProfileImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      String fileName = path.basename(pickedImage.path);
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref()
          .child('profile_images')
          .child(loggedUser!.uid)
          .child(fileName);
      firebase_storage.UploadTask uploadTask = ref.putFile(File(pickedImage.path));
      firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      setState(() {
        profileImageUrl = imageUrl;
      });

      final userDocRef =
      FirebaseFirestore.instance.collection('Users').doc(loggedUser!.uid);
      await userDocRef.update({'profileImageUrl': imageUrl});
    }
  }


  @override
  Widget build(BuildContext context) {
    double temperD = temper.toDouble();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: profileAppbar(context, _changeProfileImage),
      ),
      body: ListView(
        children: [
          profileBox(context, nick, temperD, profileImageUrl, _changeProfileImage),
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