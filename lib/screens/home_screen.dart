import 'package:flutter/material.dart';
import 'package:hackaton_ifm/screens/create_realisation_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/widgets/achievement_post_card.dart';
import 'package:hackaton_ifm/widgets/daily_message_card.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.red,
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
                child: const CreateRealisationScreen(),
                type: PageTransitionType.leftToRight,
                duration: const Duration(milliseconds: 250)),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Icon(Iconsax.message_add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Column(
              children: [
                DailyMessageCard(),
                SizedBox(
                  height: 20,
                ),
                AchievementPostCard(),
                SizedBox(
                  height: 20,
                ),
                AchievementPostCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
