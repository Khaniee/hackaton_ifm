import 'package:flutter/material.dart';
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
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.offWhite,
      ),
      home: const ScaffoldWithBottomNavbar(),
    );
  }
}
