import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/data/QuizPersonnalite.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/widgets/response_elt.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BonneConduiteQuizzScreen extends StatefulWidget {
  const BonneConduiteQuizzScreen({super.key});

  @override
  State<BonneConduiteQuizzScreen> createState() =>
      _BonneConduiteQuizzScreenState();
}

class _BonneConduiteQuizzScreenState extends State<BonneConduiteQuizzScreen> {
  final controller = ConfettiController();
  final List quizData = QuizData.get();
  int selected_quiz = 0;
  int? correct_index;
  bool en_correction = false;
  int? selectedResponse;
  int points = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.red,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Iconsax.arrow_left_2,
            color: AppColor.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: AppColor.offWhite,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        color: AppColor.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(15, 20),
                          bottomRight: Radius.elliptical(15, 20),
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height / 5) - 200 / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/${quizData[selected_quiz]['image']}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            // child: Text(""),
                          ),
                        ),
                        Positioned(
                          top: -35,
                          left: 140,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(100),
                              color: Colors.white,
                            ),
                            child: CircularPercentIndicator(
                              radius: 34.0,
                              backgroundColor: Colors.white,
                              lineWidth: 7.5,
                              animation: true,
                              percent: 1,
                              center: Text(
                                "${points}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: AppColor.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: Center(
                        child: Text(
                          quizData[selected_quiz]["question"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black45),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: List.generate(
                          quizData[selected_quiz]["reponses"].length, (index) {
                        return Container(
                          // height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: 350,
                          margin: const EdgeInsets.only(bottom: 15),
                          child: ResponseElt(
                            isSelected: selectedResponse == index,
                            isTrue: correct_index == index
                                ? en_correction == true
                                    ? true
                                    : false
                                : false,
                            isFalse: correct_index != index
                                ? correct_index != null
                                    ? selectedResponse == index
                                        ? en_correction == true
                                        : false
                                    : false
                                : false,
                            name: quizData[selected_quiz]["reponses"][index],
                            onTap: () {
                              setState(() {
                                selectedResponse = index;
                              });
                            },
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(100),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.purple,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          if (selectedResponse != null) {
                            // corriger reponse
                            if (en_correction == false) {
                              int index_vrai =
                                  quizData[selected_quiz]["correctIndex"];

                              if ((index_vrai == selectedResponse) &&
                                  (en_correction == false)) {
                                controller.play();
                                Future.delayed(Duration(milliseconds: 200), () {
                                  controller.stop();
                                });
                                setState(() {
                                  points += 1;
                                });
                              }
                              setState(() {
                                correct_index = index_vrai;
                                en_correction = true;
                              });
                            } else {
                              setState(() {
                                en_correction = false;
                                selectedResponse = null;
                              });
                              // passer à la question suivante
                              if ((selected_quiz < quizData.length - 1) ||
                                  (selected_quiz == 0)) {
                                setState(() {
                                  selected_quiz += 1;
                                });
                              } else {
                                setState(() {
                                  selected_quiz = 0;
                                });
                              }
                            }
                          }
                        },
                        child: en_correction == false
                            ? const Text("Corriger")
                            : const Text("Suivant"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ConfettiWidget(
                  emissionFrequency: 0.01,
                  confettiController: controller,
                  numberOfParticles: 20,
                  blastDirectionality: BlastDirectionality.explosive,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
