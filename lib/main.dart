
import 'package:flutter/material.dart';
import 'package:gachi/components/bottomBar.dart';
import 'package:gachi/pages/bottomMenuPage/VolunteerMainPage.dart';
import 'package:gachi/pages/bottomMenuPage/chatting.dart';
import 'package:gachi/pages/loginMain.dart';
import 'package:gachi/pages/mainPost.dart';
import 'package:gachi/pages/bottomMenuPage/profileMain.dart';
import 'package:gachi/pages/makeGachi.dart';
import 'package:gachi/pages/userAdd/userAdd.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:gachi/pages/userAdd/gachiForm.dart';


var heart = false;

PageController controller = PageController();


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
      initialRoute: '/',
      routes: {
        '/':(context)=>const MyHomePage(title: 'Flutter Demo Home Page' ),
        '/makeGachi':(context) =>  MakeGachi(),
        '/recurit':(context)=> const RescuritPage(),
        '/loginHome':(context)=> const LoginMainPage(),
        '/login':(context)=> const LoginMainPage(),
        '/profile':(context)=> const ProfilePage(),
        //'/settings':(context)=> const SettingsPage(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          Center(
              child: VolunteerMainPage()
          ),
          Center(child: Text('관심')),
          Center(child: Chatting()),
          Center(child: ProfilePage()),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
