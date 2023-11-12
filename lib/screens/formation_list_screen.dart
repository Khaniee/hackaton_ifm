import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/data/Formation.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class FormationListScreen extends StatelessWidget {
  const FormationListScreen({
    super.key,
    required this.titre,
    required this.description,
  });
  final String titre;
  final String description;

  @override
  Widget build(BuildContext context) {
    Map formation_list_category = Formation().get();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.offWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Iconsax.arrow_left_2,
            color: AppColor.purple,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ProfessionCard(
                titre: titre,
                description: description,
              ),
              Expanded(
                child: Container(
                  height: double.maxFinite,
                  child: ListView.builder(
                    itemCount: formation_list_category.length,
                    itemBuilder: (BuildContext context, int index) {
                      String cle =
                          formation_list_category.keys.elementAt(index);
                      dynamic valeur = formation_list_category[cle];

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Iconsax.folder_2,
                                    color: AppColor.purple,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  AppText(
                                    "$cle",
                                    fontSize: AppFontSize.extraLarge,
                                    color: AppColor.purple,
                                    isBold: true,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                height: 270,
                                width: double.maxFinite,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: valeur.length,
                                  itemBuilder: (BuildContext context, index2) {
                                    return GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) => BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 5, sigmaY: 5),
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
                                                color: AppColor.white
                                                    .withOpacity(0.7),
                                              ),
                                              child: FormationDetail(
                                                image:
                                                    "assets/images/formation/${valeur[index2]["image"]}",
                                                titre: valeur[index2]["titre"],
                                                auteur: valeur[index2]
                                                    ["auteur"],
                                                support: valeur[index2]
                                                    ["support"],
                                                langue: valeur[index2]
                                                    ["langue"],
                                                description: valeur[index2]
                                                    ["description"],
                                                lien: valeur[index2]["lien"],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        width: 150,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              height: 200,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black26
                                                          .withOpacity(0.17),
                                                      blurRadius: 20,
                                                      offset:
                                                          const Offset(0, 25))
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "assets/images/formation/${valeur[index2]["image"]}"),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: AppText(
                                                "${valeur[index2]["titre"]}",
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: AppFontSize.large,
                                                color: AppColor.purple,
                                                isBold: true,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.baseline,
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                children: [
                                                  const Icon(
                                                    Iconsax.user,
                                                    size: 14,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  AppText(
                                                    "${valeur[index2]["auteur"]}",
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
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormationDetail extends StatelessWidget {
  const FormationDetail({
    super.key,
    this.image,
    this.titre,
    this.auteur,
    this.support,
    this.langue,
    this.description,
    this.lien,
  });

  final String? image;
  final String? titre;
  final String? auteur;
  final String? support;
  final String? langue;
  final String? description;
  final String? lien;
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
                color: AppColor.purple,
              ),
            ),
            IconButton(
              icon: const Icon(
                Iconsax.close_square,
                size: 32,
                color: AppColor.purple,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        Center(
          child: buildFormationCover(image),
        ),
        const SizedBox(
          height: 20,
        ),
        AppText(
          titre ?? "Practical Guide for UI Design",
          overflow: TextOverflow.ellipsis,
          fontSize: AppFontSize.large,
          color: AppColor.purple,
          isBold: true,
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: AppColor.purple,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const AppText("Support"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.video_horizontal,
                        color: AppColor.textColor,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      AppText(
                        support ?? "Video",
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
                      const Icon(
                        Iconsax.user,
                        color: AppColor.textColor,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      AppText(
                        auteur ?? "N'Oel Naming",
                        isBold: true,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const AppText("Langue"),
                  SizedBox(height: 10),
                  AppText(
                    langue ?? "English",
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              "Description :",
              color: AppColor.purple,
              isBold: true,
            ),
            const SizedBox(
              height: 5,
            ),
            AppText(
              description ??
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
              backgroundColor: AppColor.purple,
              shape: const StadiumBorder(),
            ),
            onPressed: () async {
              String urlString = lien ?? 'http://tiny.cc/guvdvz';
              final Uri url = Uri.parse(urlString);
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

Container buildFormationCover(String? image) {
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
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(image ?? "assets/images/bookcover1.jpg"),
      ),
    ),
  );
}

class ProfessionCard extends StatelessWidget {
  const ProfessionCard({
    super.key,
    required this.titre,
    required this.description,
  });
  final String titre;
  final String description;
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  // "Designer & Graphiste",
                  titre,
                  isBold: true,
                  fontSize: AppFontSize.large,
                ),
                SizedBox(
                  height: 5,
                ),
                AppText(
                  // "Lorem Ipsum dolor si amet. Lorem Ipsum dolor si amet. Lorem Ipsum dolor si amet. Lorem Ipsum dolor si amet.",
                  description,
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
