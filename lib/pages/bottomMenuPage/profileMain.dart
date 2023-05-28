import 'package:flutter/material.dart';
import 'package:gachi/components/appbar.dart';
import 'package:gachi/pages/profileMain2.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
        child: profileAppbar(context),
      ),
      body: Column(
        children: [
          profileBox(context),
          profileBox2(),
        ],

      ),
    );
  }
}


/**/
class ProfileModify extends StatelessWidget {
  const ProfileModify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
