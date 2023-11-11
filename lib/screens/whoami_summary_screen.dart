import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/data/DataJob.dart';
import 'package:hackaton_ifm/screens/formation_list_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:indexed/indexed.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class WhoAmISummaryScreen extends StatefulWidget {
  const WhoAmISummaryScreen({super.key, this.listeJobCategory = const []});
  final List listeJobCategory;

  @override
  State<WhoAmISummaryScreen> createState() => _WhoAmISummaryScreenState();
}

class _WhoAmISummaryScreenState extends State<WhoAmISummaryScreen> {
  final controller = ConfettiController();
  final listeJobData = DataJob.get();
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
                color: AppColor.purple,
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
                        AppText(
                          "Félicitations! Vous avez l'âme d'un ${listeJobData[widget.listeJobCategory[0]]["nom"]}",
                          color: AppColor.primary,
                          fontSize: AppFontSize.extraLarge,
                          isBold: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                          child: AppText(
                            "Nos études nous montre que vous allez excellez dans ces carrières, dans l'ordre !",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                        children: widget.listeJobCategory.map((e) {
                      return Column(
                        children: [
                          // titre = listeJobData[e]["nom"]
                          ProfessionCard(
                            title: listeJobData[e]["nom"],
                            description: listeJobData[e]["description"],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      );
                    }).toList()),
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
    this.title = "Designer & graphiste",
    this.description = "",
  });
  final String title;
  final String description;

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
              image: const DecorationImage(
                  image: AssetImage("assets/images/designer.png"),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  isBold: true,
                  fontSize: AppFontSize.large,
                ),
                const SizedBox(
                  height: 5,
                ),
                AppText(
                  description,
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
                            color: AppColor.red.withOpacity(0.1),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const AppText(
                            "Voir les formations ...",
                            color: AppColor.red,
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
