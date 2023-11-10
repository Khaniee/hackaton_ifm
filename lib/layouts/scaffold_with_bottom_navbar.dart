import 'package:flutter/material.dart';
import 'package:hackaton_ifm/screens/createRealisationScreen.dart';
import 'package:hackaton_ifm/screens/home_screen.dart';
import 'package:hackaton_ifm/screens/menu_screen.dart';
import 'package:hackaton_ifm/screens/quiz_screen.dart';
import 'package:hackaton_ifm/screens/timeline_screen.dart';
import 'package:hackaton_ifm/screens/whoami_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';

class ScaffoldWithBottomNavbar extends StatefulWidget {
  const ScaffoldWithBottomNavbar({super.key, this.body});

  final Widget? body;

  @override
  State<ScaffoldWithBottomNavbar> createState() =>
      _ScaffoldWithBottomNavbarState();
}

class _ScaffoldWithBottomNavbarState extends State<ScaffoldWithBottomNavbar> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> pages = [
    {
      "icon": Iconsax.home,
      "selected_icon": Iconsax.home_1,
      "label": "Acceuil",
      "screen": const HomeScreen(),
    },
    {
      "icon": Iconsax.heart,
      "label": "Ligne de Vie",
      "screen": const TimelineScreen(),
    },
    {
      "icon": Iconsax.menu,
      "label": "Menu",
      "screen": const MenuScreen(),
    },
    {
      "icon": Iconsax.note,
      "selected_icon": Iconsax.note_2,
      "label": "Quizz",
      "screen": const QuizScreen(),
    },
    {
      "icon": Iconsax.personalcard,
      "label": "Qui-Suis-Je ?",
      "screen": const WhoAmIScreen(),
    },
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
        destinations: pages
            .map((e) => NavigationDestination(
                  icon: Icon(e["icon"]),
                  label: e["label"],
                  selectedIcon: Icon(e["selected_icon"] ?? e["icon"]),
                ))
            .toList(),
      ),
      body: PageStorage(
        bucket: bucket,
        child: pages[selectedIndex]["screen"],
      ),
    );
  }
}
