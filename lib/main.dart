import 'package:flutter/material.dart';
import 'package:gachi/components/bottomBar.dart';
import 'package:gachi/pages/bottomMenuPage/VolunteerMainPage.dart';
import 'package:gachi/pages/bottomMenuPage/chatting.dart';
import 'package:gachi/pages/bottomMenuPage/interesting.dart';
import 'package:gachi/pages/loginMainPage.dart';
import 'package:gachi/pages/bottomMenuPage/recruiterMainPage.dart';
import 'package:gachi/pages/bottomMenuPage/profileMain.dart';
import 'package:gachi/pages/makeGachiPage.dart';
import 'package:gachi/pages/userAdd/userAdd.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:gachi/pages/userAdd/gachiForm.dart';

var heart = false;
int pageNum = 0;

PageController controller = PageController(
  initialPage: 0
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => FormData(),
      child: MyApp(),
    ),
  );
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
        '/makeGachi':(context) =>  MakeGachi(),
        '/recurit':(context)=> const RescuritPage(),
        '/loginHome':(context)=> const LoginMainPage(),
        '/login':(context)=> const LoginMainPage(),
        '/profile':(context)=> const ProfilePage(),
        '/profileModify':(context)=> const ProfileModify(),
        '/register':(context)=> const NickName(),
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [
            Center(
              child: pageNum == 0 ? VolunteerMainPage() : RescuritPage(),
            ),
            const Center(child: Interesting()),
            const Center(child: Chatting()),
            const Center(child: ProfilePage()),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: FloatingButton(getPage),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

