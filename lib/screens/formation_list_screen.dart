import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class FormationListScreen extends StatelessWidget {
  const FormationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.offWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Iconsax.arrow_left_2,
            color: AppColor.primary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const ProfessionCard(),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Iconsax.folder_2,
                      color: AppColor.blackPrimary,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AppText(
                      "Formation Débutants",
                      fontSize: AppFontSize.extraLarge,
                      color: AppColor.blackPrimary,
                      isBold: true,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
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
                                      child: const FormationDetail(),
                                    ),
                                  ));
                        },
                        child: SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 200,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26.withOpacity(0.17),
                                        blurRadius: 20,
                                        offset: const Offset(0, 25))
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/bookcover1.jpg"),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: AppText(
                                  "Practical Guide for UI Design",
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: AppFontSize.large,
                                  color: AppColor.blackPrimary,
                                  isBold: true,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
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
                          ),
                        ),
                      );
                    },
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
    );
  }
}

class FormationDetail extends StatelessWidget {
  const FormationDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.bookmark,
                size: 32,
              ),
            ),
            IconButton(
              icon: const Icon(
                Iconsax.close_square,
                size: 32,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        Center(
          child: buildFormationCover(),
        ),
        const SizedBox(
          height: 20,
        ),
        const AppText(
          "Practical Guide for UI Design",
          overflow: TextOverflow.ellipsis,
          fontSize: AppFontSize.large,
          color: AppColor.blackPrimary,
          isBold: true,
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: AppColor.blackPrimary,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: AppColor.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  AppText("Support"),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Iconsax.video_horizontal,
                        color: AppColor.textColor,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      AppText(
                        "Video",
                        isBold: true,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  AppText("Auteur"),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Iconsax.user,
                        color: AppColor.textColor,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      AppText(
                        "N'Oel Naming",
                        isBold: true,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  AppText("Langue"),
                  SizedBox(height: 10),
                  AppText(
                    "English",
                    isBold: true,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              "Description :",
              color: AppColor.blackPrimary,
              isBold: true,
            ),
            SizedBox(
              height: 5,
            ),
            AppText(
              "Lorem ipsum dolor si amet. Lorem ipsum dolor si amet. Lorem ipsum dolor si amet. Lorem ipsum dolor si amet.Lorem ipsum dolor si amet.",
              softWrap: true,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.maxFinite,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.blackPrimary,
              shape: const StadiumBorder(),
            ),
            onPressed: () async {
              final Uri url = Uri.parse('http://tiny.cc/guvdvz');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: const AppText(
              "Ouvrir la formation",
              color: AppColor.white,
            ),
          ),
        )
      ],
    );
  }
}

Container buildFormationCover() {
  return Container(
    width: 150,
    height: 200,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Colors.black26.withOpacity(0.17),
            blurRadius: 20,
            offset: const Offset(0, 25))
      ],
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/bookcover1.jpg"),
      ),
    ),
  );
}

class ProfessionCard extends StatelessWidget {
  const ProfessionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(10),
      height: 110,
      child: Row(
        children: [
          Container(
            width: 75,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  image: AssetImage("assets/images/designer.png"),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "Designer & Graphiste",
                  isBold: true,
                  fontSize: AppFontSize.large,
                ),
                SizedBox(
                  height: 5,
                ),
                AppText(
                  "Lorem Ipsum dolor si amet. Lorem Ipsum dolor si amet. Lorem Ipsum dolor si amet. Lorem Ipsum dolor si amet.",
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
