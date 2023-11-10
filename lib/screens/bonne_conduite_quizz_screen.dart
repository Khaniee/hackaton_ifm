import 'package:flutter/material.dart';
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
  final reponses = [
    "Féliciter les amis",
    "Leur donner une gifle",
  ];
  int? selectedResponse;
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
                            image: const DecorationImage(
                              image: AssetImage("assets/images/image1.jpg"),
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
                              percent: 0.7,
                              center: const Text(
                                "70%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: AppColor.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      width: 350,
                      child: Center(
                        child: Text(
                          "Vous avez participé à un hackaton, vous avez perdu contre vos amis. Dans cette situation, que ferez-vous ? ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
                      children: List.generate(reponses.length, (index) {
                        return Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: 350,
                          margin: const EdgeInsets.only(bottom: 15),
                          child: ResponseElt(
                            isSelected: selectedResponse == index,
                            // isTrue: true,
                            // isFalse: true,
                            name: reponses[index],
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
                          backgroundColor: AppColor.purple,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {},
                        child: const Text("Suivant"),
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
