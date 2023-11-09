import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/screens/formation_list_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:indexed/indexed.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class WhoAmISummaryScreen extends StatefulWidget {
  const WhoAmISummaryScreen({super.key});

  @override
  State<WhoAmISummaryScreen> createState() => _WhoAmISummaryScreenState();
}

class _WhoAmISummaryScreenState extends State<WhoAmISummaryScreen> {
  final controller = ConfettiController();
  @override
  void initState() {
    super.initState();
    controller.play();
    Future.delayed(Duration(seconds: 2), () {
      // code to be executed after 2 seconds
      controller.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Lottie.asset(
                          'assets/images/animationCongrats.json',
                          height: 160,
                          reverse: true,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const AppText(
                          "Félicitations! Vous avez fini le test",
                          color: AppColor.primary,
                          fontSize: AppFontSize.extraLarge,
                          isBold: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                          child: AppText(
                            "Nos études nous montre que vous allez excellez dans ces carrières!",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const ProfessionCard(),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    const ProfessionCard(),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    const ProfessionCard(),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    const ProfessionCard(),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ConfettiWidget(
            emissionFrequency: 0.03,
            confettiController: controller,
            blastDirectionality: BlastDirectionality.explosive,
          ),
        ),
      ],
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
