import 'package:flutter/material.dart';
import 'package:hackaton_ifm/layouts/responsive_layout.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/achievement_post_card.dart';
import '../widgets/daily_message_card.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f7),
      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(
          icon: Icon(Iconsax.home),
          label: "Acceuil",
        ),
        NavigationDestination(
          icon: Icon(Iconsax.heart),
          label: "Ligne de Vie",
        ),
        NavigationDestination(
          icon: Icon(Iconsax.personalcard),
          label: "Qui-Suis-Je ?",
        ),
        NavigationDestination(
          icon: Icon(Iconsax.note),
          label: "Quizz",
        ),
      ]),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const DailyMessageCard(),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    AchievementPostCard(),
                    SizedBox(
                      height: 20,
                    ),
                    AchievementPostCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
