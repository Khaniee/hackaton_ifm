import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackaton_ifm/screens/quizBonneConduite.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rive/rive.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  StateMachineController? controller3;
  SMITrigger? _bump;
// _bump?.fire();

  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      _bump?.fire();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(185, 240, 142, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(
                  "Quizz",
                  color: AppColor.red,
                  fontSize: 56,
                  isBold: true,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Center(
              child: AppText(
                "Soyez la meilleure version de vous même, et contribuez à rendre le monde meilleur grâce à notre quizz.",
                textAlign: TextAlign.start,
                fontSize: 15,
                color: AppColor.purple,
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 400,
            child: RiveAnimation.asset(
              "assets/images/squat.riv",
              onInit: (artboard) {
                controller3 = StateMachineController.fromArtboard(
                  artboard,
                  "Don't Skip Leg Day",
                );
                if (controller3 != null) {
                  artboard.addController(controller3!);
                  _bump = controller3!.findInput<bool>('Squat') as SMITrigger;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: const Icon(Iconsax.play),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const QuizBonneConduite(),
                          ),
                        );
                      },
                      label: const Text("Commencer le quiz")),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
