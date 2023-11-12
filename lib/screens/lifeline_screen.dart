import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/providers/current_user_provider.dart';
import 'package:hackaton_ifm/screens/create_realisation_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/widgets/single_timeline.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:indexed/indexed.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import '../widgets/event_form.dart';

class LifelineScreen extends StatefulWidget {
  const LifelineScreen({super.key});

  @override
  State<LifelineScreen> createState() => _LifelineState();
}

class _LifelineState extends State<LifelineScreen> {
  StateMachineController? controller;
  SMIInput<double>? inputValue;

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
      CurrentUserProvider userProvider =
          Provider.of<CurrentUserProvider>(context, listen: false);
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
    CurrentUserProvider userProvider =
        Provider.of<CurrentUserProvider>(context);
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
                  child: Row(
                    children: [
                      if (objectifPrincipal.isNotEmpty) ...[
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {
                              showAddEventBottomSheet(
                                context,
                                isPrincipal: true,
                              );
                            },
                            icon: const Icon(
                              Iconsax.edit,
                              color: AppColor.purple,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                      ElevatedButton.icon(
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
                    ],
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
                      event: timelineData[index],
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
}

Future<dynamic> showAddEventBottomSheet(
  BuildContext context, {
  bool isPrincipal = false,
  Map? event,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: AppColor.white.withOpacity(0.7),
        ),
        child: EventForm(
          isPrincipal: isPrincipal,
          event: event,
        ),
      ),
    ),
  );
}
