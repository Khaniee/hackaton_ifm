import 'package:flutter/material.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';

class DailyMessageCard extends StatelessWidget {
  const DailyMessageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColor.purple.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Icon(
              Iconsax.message_favorite,
              color: AppColor.white,
              size: 32,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AppText(
            "Dans ces moment difficile, il est important de s'entraider entre nous.",
            color: AppColor.white,
            fontSize: AppFontSize.large,
          ),
          SizedBox(
            height: 10,
          ),
          AppText(
            "#VivreMeuilleur",
            color: AppColor.white,
          )
        ],
      ),
    );
  }
}
