import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hackaton_ifm/data/TimeLineData.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/single_timeline.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:indexed/indexed.dart';
import 'package:rive/rive.dart';

class LifelineScreen extends StatefulWidget {
  const LifelineScreen({super.key});

  @override
  State<LifelineScreen> createState() => _LifelineState();
}

class _LifelineState extends State<LifelineScreen> {
  List timelineData = TimeLineData.get();

  StateMachineController? controller;
  SMIInput<double>? inputValue;
  List<String> objectifVisibility = ["Public", "Privé"];
  String selectedObjectif = "Public";

  @override
  void initState() {
    super.initState();
  }

  Future<void> animateTree() async {
    if (inputValue != null) {
      while (inputValue!.value <= 100) {
        inputValue?.change(inputValue!.value + 3);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Indexer(
        children: [
          Indexed(
            index: 2,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 250,
                  width: double.maxFinite,
                  color: AppColor.purple,
                  child: Indexer(
                    children: [
                      Indexed(
                        index: 2,
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.height / 4),
                          child: Container(
                            width: double.maxFinite,
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              height: 250,
                              child: RiveAnimation.asset(
                                "assets/images/treedemo.riv",
                                fit: BoxFit.fitHeight,
                                onInit: (artboard) {
                                  controller =
                                      StateMachineController.fromArtboard(
                                    artboard,
                                    "Grow",
                                  );
                                  if (controller != null) {
                                    artboard.addController(controller!);
                                    inputValue = controller?.findInput("input");
                                    inputValue?.change(1);
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Indexed(
                        index: 1,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 60,
                              left: MediaQuery.of(context).size.height / 6),
                          child: const Center(
                            child: Text(
                              "Construire une entreprise et reussir dans la vie",
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -20,
                  right: 10,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      showAddEventBottomSheet(context);
                      // inputValue?.change(inputValue!.value + 3);
                    },
                    icon: const Icon(Iconsax.add),
                    label: const AppText(
                      "Ajouter Objectif",
                      color: AppColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Indexed(
            index: 1,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 35, top: 250),
                child: ListView(
                  children: List.generate(timelineData.length, (index) {
                    // if(timelineData[index]["type"] == "step"){
                    return SingleTimeline(
                      title: timelineData[index]["title"],
                      image: timelineData[index]["type"] != "step"
                          ? timelineData[index]["image"]
                          : "",
                      // is_first: index == 0,
                      is_last: index == timelineData.length - 1,
                      is_step: timelineData[index]["type"] == "step",
                    );
                    // }
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showAddEventBottomSheet(
    BuildContext context,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: AppColor.white.withOpacity(0.7),
          ),
          child: StatefulBuilder(
            builder: (context, setState) => Form(
              child: Container(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 15,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const AppText(
                      "Ajouter un objectif",
                      fontSize: AppFontSize.large,
                      isBold: true,
                      color: AppColor.purple,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // controller: titleInputController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Titre obligatoire";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        prefixIcon: const Icon(
                          Iconsax.star,
                          color: AppColor.purple,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "Entrer le titre ici",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Visibilité"),
                        // Expanded(child: SizedBox()),
                        Container(
                          width: 150,
                          height: 60,
                          child: DropdownButtonFormField<String>(
                            isDense: true,
                            // iconSize: 12,
                            alignment: Alignment.bottomCenter,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              // labelStyle:
                              //     TextStyle(color: Colors.grey.shade500),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              prefixIcon: selectedObjectif == "Public"
                                  ? const Icon(
                                      Iconsax.global,
                                      color: AppColor.purple,
                                    )
                                  : const Icon(Iconsax.lock,
                                      color: AppColor.purple),
                            ),
                            hint: Text(selectedObjectif),
                            style: const TextStyle(
                              color: AppColor.textColor,
                            ),
                            items: objectifVisibility.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (elt) {
                              setState(() {
                                selectedObjectif = elt!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.red,
                        ),
                        onPressed: () {
                          inputValue?.change(inputValue!.value + 3);
                        },
                        child: const Text("Créer Objectif"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}