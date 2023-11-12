import 'package:flutter/material.dart';
import 'package:hackaton_ifm/providers/realisation_provider.dart';
import 'package:hackaton_ifm/screens/create_realisation_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/achievement_post_card.dart';
import 'package:hackaton_ifm/widgets/daily_message_card.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RealisationProvider realisationProvider =
        Provider.of<RealisationProvider>(context);

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
            child: Column(
              children: [
                const DailyMessageCard(),
                if (realisationProvider.realisations.isNotEmpty)
                  ...realisationProvider.realisations.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: AchievementPostCard(realisation: e),
                    ),
                  )
                else ...[
                  const SizedBox(
                    height: 50,
                  ),
                  const Icon(
                    Iconsax.note_favorite,
                    size: 100,
                    color: AppColor.purple,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AppText(
                    "Suivez les autres pour voir leur réalisations ici",
                    textAlign: TextAlign.center,
                    fontSize: AppFontSize.extraExtraLarge,
                    color: AppColor.purple,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
