import 'package:flutter/material.dart';
import 'package:hackaton_ifm/providers/user_provider.dart';
import 'package:hackaton_ifm/screens/whoami_quizz_screen.dart';
import 'package:hackaton_ifm/screens/whoami_summary_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    List dernierResultat = userProvider.getlisteJobCategory();

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColor.white,
          // padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: double.maxFinite,
                  // height: 200,
                  child: Lottie.asset(
                    'assets/images/whoami.json',
                    reverse: true,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        AppText(
                          "Qui-Suis-Je ?",
                          color: AppColor.purple,
                          fontSize: 56,
                          isBold: true,
                        ),
                        Center(
                          child: AppText(
                            "100+ formations à découvrir selon vos personnalité et compétences!",
                            textAlign: TextAlign.center,
                            fontSize: 14,
                            color: AppColor.purple,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(child: SizedBox()),
                    SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.purple,
                            foregroundColor: AppColor.white,
                            shape: const StadiumBorder(),
                          ),
                          icon: const Icon(Iconsax.play),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const WhoAmIQuizzScreen(),
                              ),
                            );
                          },
                          label: const Text("Commencer le test")),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    dernierResultat.isNotEmpty
                        ? SizedBox(
                            height: 50,
                            width: double.maxFinite,
                            child: OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: AppColor.white,
                                  foregroundColor: AppColor.purple,
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => WhoAmISummaryScreen(
                                        listeJobCategory: dernierResultat,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Iconsax.clock),
                                label: const Text("Voir dernier résultat")),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
