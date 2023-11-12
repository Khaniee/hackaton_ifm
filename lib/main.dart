import 'package:flutter/material.dart';
import 'package:hackaton_ifm/providers/user_provider.dart';
import 'package:hackaton_ifm/screens/lifeline_screen.dart';
import 'package:hackaton_ifm/screens/on_boarding_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hackaton IFM',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.offWhite,
        ),
        home: const WelcomePage(),
      ),
    );
  }
}
