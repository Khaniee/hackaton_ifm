import 'package:flutter/material.dart';
import 'package:hackaton_ifm/screens/createRealisationScreen.dart';
import 'package:hackaton_ifm/screens/home_screen.dart';
import 'package:hackaton_ifm/screens/quiz_screen.dart';
import 'package:hackaton_ifm/screens/timeline_screen.dart';
import 'package:hackaton_ifm/screens/whoami_screen.dart';
import 'package:iconsax/iconsax.dart';

class ScaffoldWithBottomNavbar extends StatefulWidget {
  const ScaffoldWithBottomNavbar({super.key, this.body});

  final Widget? body;

  @override
  State<ScaffoldWithBottomNavbar> createState() =>
      _ScaffoldWithBottomNavbarState();
}

class _ScaffoldWithBottomNavbarState extends State<ScaffoldWithBottomNavbar> {
  int selectedIndex = 1;
  final List<Widget> screens = [
    const HomeScreen(),
    const CreateRealisationScreen(),
    // const TimelineScreen(),
    const WhoAmIScreen(),
    const QuizScreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 70,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.home),
            label: "Acceuil",
            selectedIcon: Icon(Iconsax.home_1),
          ),
          NavigationDestination(
            icon: Icon(Iconsax.heart),
            label: "Ligne de Vie",
            selectedIcon: Icon(Iconsax.heart),
          ),
          NavigationDestination(
            icon: Icon(Iconsax.personalcard),
            label: "Qui-Suis-Je ?",
          ),
          NavigationDestination(
            icon: Icon(Iconsax.note),
            label: "Quizz",
            selectedIcon: Icon(Iconsax.note_2),
          ),
        ],
      ),
      body: PageStorage(
        bucket: bucket,
        child: screens[selectedIndex],
      ),
    );
  }
}
