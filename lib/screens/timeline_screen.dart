import 'package:flutter/material.dart';
import 'package:hackaton_ifm/data/TimeLineData.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/singleTimeLine.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:indexed/indexed.dart';
import 'package:rive/rive.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimelineScreen> {
  List timelineData = TimeLineData.get();

  StateMachineController? controller;
  SMIInput<double>? inputValue;
  List<String> objectifVisibility = ["Public", "Privé"];
  String selectedObjectif = "Public";
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
                  height: 200,
                  width: double.maxFinite,
                  color: Colors.deepPurple.shade100,
                  child: Indexer(
                    children: [
                      Indexed(
                        index: 1,
                        child: Container(
                          height: 200,
                          child: RiveAnimation.asset(
                            "assets/images/treedemo.riv",
                            fit: BoxFit.fitHeight,
                            onInit: (artboard) {
                              controller = StateMachineController.fromArtboard(
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
                      const Indexed(
                        index: 2,
                        child: Center(
                          child: Text(
                            "Construire une entreprise",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
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
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      showAddEventBottomSheet(context);
                      // inputValue?.change(inputValue!.value + 3);
                    },
                    icon: Icon(Icons.add),
                    label: Text("Ajouter"),
                  ),
                ),
              ],
            ),
          ),
          Indexed(
            index: 1,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 35, top: 160),
                child: ListView(
                    children: List.generate(timelineData.length, (index) {
                  // if(timelineData[index]["type"] == "step"){
                  return SingleTimeLine(
                    title: timelineData[index]["title"],
                    image: timelineData[index]["type"] != "step"
                        ? timelineData[index]["image"]
                        : "",
                    // is_first: index == 0,
                    is_last: index == timelineData.length - 1,
                    is_step: timelineData[index]["type"] == "step",
                  );
                  // }
                })),
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => Form(
            child: Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 15,
              ),
              width: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: AppText(
                      "Ajouter un objectif",
                      fontSize: AppFontSize.large,
                    ),
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
                      prefixIcon: const Icon(Iconsax.star),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Titre',
                    ),
                  ),
                  SizedBox(
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
                                ? const Icon(Iconsax.global)
                                : const Icon(Iconsax.lock),
                          ),
                          hint: Text(selectedObjectif),
                          style: TextStyle(
                            color: AppColor.textColor,
                          ),
                          items: objectifVisibility.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
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
                        backgroundColor: Colors.deepPurple,
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
        );
      },
    );
  }
}
