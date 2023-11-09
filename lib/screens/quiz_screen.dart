import 'package:flutter/material.dart';
import 'package:hackaton_ifm/screens/quizBonneConduite.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/widgets/text.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.middlePrimary,
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const QuizBonneConduite(),
              ),
            );
          },
          child: const Text("Commencer Quiz"),
        ),
      ),
    );
  }
}
