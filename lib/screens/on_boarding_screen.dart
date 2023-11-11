import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackaton_ifm/screens/loginScreen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rive/rive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController _controller = PageController();
  StateMachineController? controller1;
  SMIInput<double>? inputValue1;
  StateMachineController? controller2;
  SMIInput<bool>? inputValue2;
  List<String> third_title = [
    "Humain\nintelligent",
    "Humain\naccomplie",
    "Humain\nqui sait ce qu'il fait dans la vie.",
  ];
  int selected_title = 0;

  void initState() {
    super.initState();
    startAnimation();
    Timer.periodic(Duration(seconds: (1 * 3) + 2), (timer) {
      startAnimation();
    });
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (selected_title < 2) {
        setState(() {
          selected_title += 1;
        });
      } else {
        setState(() {
          selected_title = 0;
        });
      }
    });
  }

  Future<void> startAnimation() async {
    double i = 0;
    int transition = 1;
    // while (i < 3) {
    Future.delayed(Duration(seconds: 0), () {
      // code to be executed after 2 seconds
      inputValue1?.change(i);
      i++;
    }).then((value) => Future.delayed(Duration(seconds: transition), () {
          // code to be executed after 2 seconds
          inputValue1?.change(i);
          i++;
        }).then((value) => Future.delayed(Duration(seconds: transition), () {
              // code to be executed after 2 seconds
              inputValue1?.change(2);
              i++;
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Stack(
                children: [
                  Container(
                    color: AppColor.red,
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: RiveAnimation.asset(
                                // "assets/images/age.riv",
                                "assets/images/mixing_animations.riv",
                                onInit: (artboard) {
                                  controller1 =
                                      StateMachineController.fromArtboard(
                                    artboard,
                                    "State Machine 1",
                                    // "AgeClasses",
                                  );
                                  if (controller1 != null) {
                                    artboard.addController(controller1!);
                                    inputValue1 =
                                        controller1?.findInput("level");
                                    inputValue1?.change(0);
                                  }
                                },
                              ),
                            ),
                            Container(
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    color: AppColor.red,
                                    height: 50,
                                    width: double.maxFinite,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SlideText(
                    title: "Apprenez et grandissez",
                    description:
                        "Deviens une meilleure personne grâce à nos quiz et nos petits messages",
                  ),
                ],
              ),
              Container(
                color: const Color.fromRGBO(195, 72, 84, 1),
                width: double.maxFinite,
                height: double.maxFinite,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.height / 1.5,
                          child: RiveAnimation.asset(
                            "assets/images/variation.riv",
                            onInit: (artboard) {
                              controller2 = StateMachineController.fromArtboard(
                                artboard,
                                "State Machine 1",
                              );
                              if (controller2 != null) {
                                artboard.addController(controller2!);
                                inputValue2 = controller2?.findInput("break");
                                inputValue2?.change(false);
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    const SlideText(
                      title: "Fixez vos objectifs et suivez vos progrès",
                      description:
                          "Définis tes objectifs, partage tes progrès et sois fière de ce que tu as accompli.",
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color.fromRGBO(70, 46, 84, 1),
                width: double.maxFinite,
                height: double.maxFinite,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: const RiveAnimation.asset(
                                "assets/images/rocket.riv",
                              ),
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: Column(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    height: 50,
                                    child: SizedBox(
                                      width: 200,
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          backgroundColor: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              child: LoginScreen(),
                                              type: PageTransitionType.fade,
                                              duration: const Duration(
                                                  milliseconds: 400),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "Commencer",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 80,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SlideText(
                      title_size: 40,
                      title: "${third_title[selected_title]}",
                      description:
                          "Découvre qui tu es et choisi parmi les +100 formations à découvrir selon ta personnalité et ton choix de carriere.",
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.9),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.white54,
                activeDotColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideText extends StatelessWidget {
  const SlideText({
    super.key,
    required this.title,
    required this.description,
    this.title_size = 40,
  });

  final String title;
  final String description;
  final double title_size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 100,
      ),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            child: Text(
              textAlign: TextAlign.start,
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: title_size,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
