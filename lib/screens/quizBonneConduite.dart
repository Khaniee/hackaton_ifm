import 'package:flutter/material.dart';
import 'package:hackaton_ifm/data/QuizPersonnalite.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/widgets/response_elt.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class QuizBonneConduite extends StatefulWidget {
  const QuizBonneConduite({super.key});

  @override
  State<QuizBonneConduite> createState() => _QuizBonneConduiteState();
}

class _QuizBonneConduiteState extends State<QuizBonneConduite> {
  final List quizData = QuizData.get();
  int selected_quiz = 0;
  int? correct_index;
  bool en_correction = false;
  int? selectedResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(122, 115, 231, 1),
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
              color: const Color.fromRGBO(223, 225, 229, 1),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(122, 115, 231, 1),
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
                              image: AssetImage("assets/images/image1.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
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
                              percent: 0.7,
                              center: const Text(
                                "70%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: AppColor.middlePrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
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
                          height: 50,
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
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(100),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.middlePrimary,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          if (selectedResponse != null) {
                            // corriger reponse
                            if (en_correction == false) {
                              int index_vrai =
                                  quizData[selected_quiz]["correctIndex"];
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
          ],
        ),
      ),
    );
  }
}
