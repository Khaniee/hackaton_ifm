import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:hackaton_ifm/widgets/timelineCard.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timeline_tile/timeline_tile.dart';

class SingleTimeline extends StatefulWidget {
  SingleTimeline({
    super.key,
    this.is_first = false,
    this.is_last = false,
    this.is_step = false,
    this.image = "",
    required this.title,
  });
  bool is_first;
  bool is_step;
  bool is_last;
  String image;
  String title;

  @override
  State<SingleTimeline> createState() => _SingleTimelineState();
}

class _SingleTimelineState extends State<SingleTimeline> {
  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: widget.is_first,
      isLast: widget.is_last,
      beforeLineStyle: const LineStyle(
        color: AppColor.purple,
      ),
      indicatorStyle: IndicatorStyle(
        width: 30,
        color: AppColor.red,
        iconStyle: IconStyle(
          iconData:
              widget.is_step ? Icons.rocket_launch : Icons.star_rate_rounded,
          color: Colors.white,
        ),
      ),
      endChild: widget.is_step
          ? Container(
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            // Iconsax.lock,
                            Iconsax.global,
                            size: 20,
                            color: AppColor.purple,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                            widget.title,
                            isBold: true,
                            color: AppColor.purple,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {
                            showModalPopup(context);
                          },
                          color: AppColor.purple,
                          icon: const Icon(Iconsax.more),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          : Container(
              margin: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Iconsax.calendar_1,
                        size: 20,
                        color: AppColor.purple,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      AppText(
                        "18 Jun 2023",
                        color: AppColor.purple,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/${widget.image}"),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      // Iconsax.lock,
                                      Iconsax.global,
                                      size: 20,
                                      color: AppColor.purple,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    AppText(
                                      widget.title,
                                      isBold: true,
                                      color: AppColor.purple,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                onPressed: () {
                                  showModalPopup(context);
                                },
                                color: AppColor.purple,
                                icon: const Icon(Iconsax.more),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<dynamic> showModalPopup(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          child: const AppText(
            'Annuler',
            color: AppColor.purple,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// default behavior, turns the action's text to bold text.
            onPressed: () {
              Navigator.pop(context);
            },
            child: const AppText(
              'Afficher détail',
              color: AppColor.purple,
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const AppText(
              'Afficher les formations correspondante',
              color: AppColor.purple,
            ),
          ),
        ],
      ),
    );
  }
}
