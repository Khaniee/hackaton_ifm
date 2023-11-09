import 'package:flutter/material.dart';
import 'package:hackaton_ifm/screens/createAcountScreen.dart';
import 'package:hackaton_ifm/screens/loginScreen.dart';
import 'package:hackaton_ifm/screens/on_boarding_screen.dart';
import 'package:hackaton_ifm/screens/timeLine_screen.dart';
import 'package:hackaton_ifm/layouts/scaffold_with_bottom_navbar.dart';
import 'package:hackaton_ifm/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hackaton IFM',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.offWhite,
      ),
      // home: const ScaffoldWithBottomNavbar(),
      home: const WelcomePage(),
    );
  }
}
