import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/screens/formation_list_screen.dart';
import 'package:hackaton_ifm/screens/bonne_conduite_quizz_screen.dart';
import 'package:hackaton_ifm/screens/on_boarding_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double top = coverHeight - (profileHeight);
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title:
                    const Text("Vous êtes sur le point de vous déconnecter."),
                content: const Text(
                    "Votre session sera perdue et vous allez être déconnecter de l'application"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Annuler",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        PageTransition(
                          child: WelcomePage(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 400),
                        ),
                      );
                    },
                    child: const Text(
                      "Se déconnecter",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Icon(Iconsax.logout),
          backgroundColor: AppColor.red,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      buildBackground(),
                      Positioned(
                        top: 0,
                        child: Column(
                          children: [
                            buildProfileImage(),
                            SizedBox(height: 10),
                            const AppText(
                              "Nomsasa",
                              fontSize: AppFontSize.large,
                              isBold: true,
                            ),
                            SizedBox(height: 5),
                            AppText("johndoe@gmail.com")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Iconsax.bookmark,
                        color: AppColor.purple,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      AppText(
                        "Formations enrégistrée",
                        fontSize: AppFontSize.large,
                        color: AppColor.purple,
                        isBold: true,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      mainAxisExtent: 250,
                    ),
                    itemCount: 3,
                    itemBuilder: (_, index) => Container(
                        child: Column(
                      children: [
                        InkWell(
                            onTap: () => showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) => BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 15,
                                        left: 15,
                                        right: 15,
                                        bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom +
                                            15,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                        color: AppColor.white.withOpacity(0.7),
                                      ),
                                      child: FormationDetail(),
                                    ),
                                  ),
                                ),
                            child: buildFormationCover(null)),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: AppText(
                            "Practical Guide for UI Design",
                            overflow: TextOverflow.ellipsis,
                            fontSize: AppFontSize.large,
                            color: AppColor.purple,
                            isBold: true,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Icon(
                                Iconsax.user,
                                size: 14,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              AppText(
                                "N'Oel Naming",
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final double coverHeight = 125;
  final double profileHeight = 60;

  Widget buildProfileImage() {
    return Container(
      height: profileHeight * 2,
      width: profileHeight * 2,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/avatar1.png"),
          ),
          border: Border.all(color: AppColor.white, width: 5),
          borderRadius: BorderRadius.circular(20)),
    );
    // return CircleAvatar(
    //   backgroundColor: AppColor.primary,
    //   radius: profileHeight,
    //   backgroundImage: AssetImage("assets/images/avatar1.png"),
    // );
  }

  Widget buildBackground() {
    return Column(
      children: [
        SizedBox(
          height: profileHeight,
        ),
        Container(
          height: coverHeight,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
        ),
      ],
    );
  }
}
