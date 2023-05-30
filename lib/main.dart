import 'package:flutter/material.dart';
import 'package:gachi/components/bottomBar.dart';
import 'package:gachi/firebase_options.dart';
import 'package:gachi/pages/bottomMenuPage/VolunteerMainPage.dart';
import 'package:gachi/pages/bottomMenuPage/chatting.dart';
import 'package:gachi/pages/bottomMenuPage/interesting.dart';
import 'package:gachi/pages/loginMain.dart';
import 'package:gachi/pages/mainPost.dart';
import 'package:gachi/pages/bottomMenuPage/profileMain.dart';
import 'package:gachi/pages/makeGachi.dart';
//import 'package:gachi/pages/settingsMain.dart';
import 'package:gachi/pages/userAdd/userAdd.dart';
import 'package:firebase_core/firebase_core.dart';

var heart = false;
int pageNum = 0;
int postNum = 0;

PageController controller = PageController();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginHome',
      routes: {
        '/':(context)=>const MyHomePage(title: 'Flutter Demo Home Page' ),
        '/makeGachi':(context) => const MakeGachi(),
        '/recurit':(context)=> const RescuritPage(),
        '/loginHome':(context)=> const LoginMainPage(),
        '/login':(context)=> const LoginMainPage(),
        '/profile':(context)=> const ProfilePage(),
        //'/settings':(context)=> const SettingsPage(),
        '/profileModify':(context)=> const ProfileModify(),
        '/register':(context)=> const NickName(),
        //  '/regiseter':(context)=>(), 여기에 회원가입 페이지추가하면 돼요.
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  void getPage(int returnNum) {
    setState(() {
      pageNum = returnNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          Center(
              child: pageNum == 0 ? VolunteerMainPage() : RescuritPage()
          ),
          Center(child: Interesting()),
          Center(child: Chatting()),
          Center(child: ProfilePage()),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: FloatingButton(getPage),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
