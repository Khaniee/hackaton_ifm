import 'package:flutter/material.dart';
import 'package:hackaton_ifm/widgets/achievement_post_card.dart';
import 'package:hackaton_ifm/widgets/daily_message_card.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Icon(Iconsax.message_add),
      ),
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
