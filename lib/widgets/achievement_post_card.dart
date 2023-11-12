import 'package:flutter/material.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class AchievementPostCard extends StatelessWidget {
  const AchievementPostCard({
    super.key,
    required this.realisation,
  });

  final Map realisation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: realisation["avatar"] != null
                        ? NetworkImage(realisation["avatar"])
                        : const AssetImage("assets/images/avatar1.png")
                            as ImageProvider,
                    fit: BoxFit.fill,
                  ),
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
                      realisation["username"] ?? "Jennifer Cole",
                      isBold: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Iconsax.calendar,
                          color: AppColor.textColor,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(
                          "18 Sept 2023",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          AppText(
            realisation["title"],
            isBold: true,
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: (realisation["image"] is String)
                ? Image.asset(realisation["image"])
                : Image.file(
                    realisation["image"],
                    width: double.maxFinite,
                    fit: BoxFit.fill,
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          AppText(
            realisation["description"],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Lottie.asset(
                    'assets/images/heart_clicked.json',
                    height: 40,
                  ),
                  const AppText("1,234"),
                ],
              ),
              const Icon(Iconsax.clipboard)
            ],
          )
        ],
      ),
    );
  }
}
