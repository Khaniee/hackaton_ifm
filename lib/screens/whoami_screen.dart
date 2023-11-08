import 'package:flutter/material.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                children: [
                  AppText(
                    "Qui-Suis-Je ?",
                    color: AppColor.primary,
                    fontSize: 56,
                    isBold: true,
                  ),
                  Center(
                    child: AppText(
                      "100+ formations à découvrir selon vos personnalité et compétences!",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset("assets/images/quiz_app.png"),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.darkPrimary,
                      foregroundColor: AppColor.white,
                    ),
                    onPressed: () {},
                    icon: const Icon(Iconsax.play),
                    label: const Text("Commencer le test")),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColor.white,
                      foregroundColor: AppColor.darkPrimary,
                    ),
                    onPressed: () {},
                    icon: const Icon(Iconsax.clock),
                    label: const Text("Voir dernier résultat")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
