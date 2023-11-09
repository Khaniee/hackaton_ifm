import 'package:flutter/material.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/core.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class AchievementPostCard extends StatelessWidget {
  const AchievementPostCard({
    super.key,
  });

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
                    image: AssetImage("assets/images/avatar1.png"),
                    fit: BoxFit.fill,
                  ),
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
                      "Jennifer Cole",
                      isBold: true,
                    ),
                    Row(
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
                          "18 Sept 2023 à 18:00",
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
          const AppText(
            "Lorem Ipsum dolor si amet",
            isBold: true,
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              "assets/images/achievement1.jpg",
              width: double.maxFinite,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const AppText(
            "Lorem Ipsum dolor si amet. Lorem Ipsum dolor si amet. Lorem Ipsum dolor si amet.",
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
                    // reverse: true,
                    // fit: BoxFit.fill,
                  ),

                  // Icon(Iconsax.heart),

                  // SizedBox(
                  //   width: 10,
                  // ),
                  AppText("1,234"),
                ],
              ),
              Icon(Iconsax.clipboard)
            ],
          )
        ],
      ),
    );
  }
}
