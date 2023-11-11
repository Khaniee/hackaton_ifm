import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:hackaton_ifm/data/TimeLineData.dart';
import 'package:hackaton_ifm/providers/user_provider.dart';
import 'package:hackaton_ifm/screens/create_realisation_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/single_timeline.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:indexed/indexed.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class LifelineScreen extends StatefulWidget {
  const LifelineScreen({super.key});

  @override
  State<LifelineScreen> createState() => _LifelineState();
}

class _LifelineState extends State<LifelineScreen> {
  StateMachineController? controller;
  SMIInput<double>? inputValue;
  List<String> objectifVisibility = ["Public", "Privé"];
  String selectedObjectif = "Public";

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      Future.doWhile(() async {
        await Future.delayed(const Duration(milliseconds: 250));
        if (inputValue!.value <= 100) {
          inputValue?.change(inputValue!.value + 3);
          return true;
        } else {
          return false;
        }
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      String objectifPrincipal = userProvider.objectifPrincipale;
      if (objectifPrincipal.isEmpty) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text("Bienvenue!"),
            content: const Text(
                "Définissez votre objectif principale pour continuer."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Définir plus tard",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  showAddEventBottomSheet(context, isPrincipal: true);
                },
                child: const Text(
                  "Définir maintenant",
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    String objectifPrincipal = userProvider.objectifPrincipale;
    List timelineData = userProvider.getRealisationsObjectif();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.red,
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
                child: const CreateRealisationScreen(),
                type: PageTransitionType.leftToRight,
                duration: const Duration(milliseconds: 250)),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Icon(Iconsax.message_add),
      ),
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
                          child: Center(
                            child: Text(
                              userProvider.objectifPrincipale,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: const TextStyle(
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
                      showAddEventBottomSheet(context,
                          isPrincipal: objectifPrincipal.isEmpty);
                    },
                    icon: const Icon(Iconsax.add),
                    label: AppText(
                      objectifPrincipal.isEmpty
                          ? "Ajouter un objectif principal"
                          : "Ajouter un objectif",
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

  final TextEditingController titleInputController = TextEditingController();

  Future<dynamic> showAddEventBottomSheet(
    BuildContext context, {
    bool isPrincipal = false,
  }) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
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
            // bottom: MediaQuery.of(context).viewInsets.bottom + 15,
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
                    if (isPrincipal) ...[
                      const Center(
                        child: Icon(
                          Iconsax.star_1,
                          size: 64,
                          color: AppColor.purple,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                    if (isPrincipal)
                      const Center(
                        child: AppText(
                          "MON OBJECTIF PRINCIPAL",
                          fontSize: AppFontSize.large,
                          isBold: true,
                          color: AppColor.purple,
                        ),
                      )
                    else
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
                      controller: titleInputController,
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
                    if (!isPrincipal) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("Visibilité"),
                          // Expanded(child: SizedBox()),
                          SizedBox(
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
                      )
                    ],
                    SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.red,
                        ),
                        onPressed: () {
                          if (isPrincipal) {
                            userProvider.updateObjectifPrincipale(
                                titleInputController.text);
                          } else {
                            userProvider
                                .createObjectif(titleInputController.text);
                          }
                          titleInputController.text = "";
                          Navigator.pop(context);
                        },
                        child: Text(isPrincipal
                            ? "Posez mon Objectif Principal"
                            : "Créer Objectif"),
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
