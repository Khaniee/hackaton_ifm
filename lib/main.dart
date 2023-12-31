import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/firebase_options.dart';
import 'package:hackaton_ifm/providers/realisation_provider.dart';
import 'package:hackaton_ifm/providers/current_user_provider.dart';
import 'package:hackaton_ifm/screens/on_boarding_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        title: 'LifeLearn',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.offWhite,
        ),
        home: const WelcomePage(),
      ),
    );
  }
}
