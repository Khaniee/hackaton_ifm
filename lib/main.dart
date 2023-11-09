import 'package:flutter/material.dart';
import 'package:hackaton_ifm/screens/createAcountScreen.dart';
import 'package:hackaton_ifm/screens/loginScreen.dart';
import 'package:hackaton_ifm/screens/on_boarding_screen.dart';
import 'package:hackaton_ifm/screens/timeLine_screen.dart';
import 'package:hackaton_ifm/layouts/scaffold_with_bottom_navbar.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StateMachineController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hackaton IFM',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.offWhite,
      ),
      home: Scaffold(
        // backgroundColor: Color(0xff462e54),
        // body: Container(
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //   ),
        //   child: RiveAnimation.asset(
        //     "assets/images/rocket.riv",
        //   ),
        // ),
        body: WelcomePage(),
      ),
    );
  }
}
