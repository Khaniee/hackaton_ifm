import 'package:flutter/material.dart';
import 'package:hackaton_ifm/layouts/scaffold_with_bottom_navbar.dart';
import 'package:hackaton_ifm/providers/realisation_provider.dart';
import 'package:hackaton_ifm/providers/current_user_provider.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentUserProvider()),
        ChangeNotifierProvider(create: (context) => RealisationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hackaton IFM',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.offWhite,
        ),
        home: const ScaffoldWithBottomNavbar(),
      ),
    );
  }
}
