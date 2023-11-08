import 'package:flutter/material.dart';
import 'package:hackaton_ifm/screens/formation_list_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';

class WhoAmISummaryScreen extends StatelessWidget {
  const WhoAmISummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.offWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Iconsax.arrow_left_2,
            color: AppColor.primary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Iconsax.medal_star5,
                      color: AppColor.primary,
                      size: 120,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppText(
                      "Félicitations! Vous avez finis le test",
                      color: AppColor.primary,
                      fontSize: AppFontSize.extraLarge,
                      isBold: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: AppText(
                        "Nos études nous montre que vous allez excellez dans ces carrières!",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ProfessionCard(),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                ProfessionCard(),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                ProfessionCard(),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                ProfessionCard(),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfessionCard extends StatelessWidget {
  const ProfessionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Container(
            width: 75,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  "Designer & Graphiste",
                  isBold: true,
                  fontSize: AppFontSize.large,
                ),
                const SizedBox(
                  height: 5,
                ),
                const AppText(
                  "Lorem Ipsum dolor si amet. Lorem Ipsum dolor si amet. Lorem Ipsum dolor si amet. ",
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const FormationListScreen(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.primary.withOpacity(0.1),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const AppText(
                            "Voir les formations ...",
                            color: AppColor.darkPrimary,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
