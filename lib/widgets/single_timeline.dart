import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/providers/user_provider.dart';
import 'package:hackaton_ifm/screens/create_realisation_screen.dart';
import 'package:hackaton_ifm/screens/lifeline_screen.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/widgets/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

class SingleTimeline extends StatefulWidget {
  const SingleTimeline({
    super.key,
    this.is_first = false,
    this.is_last = false,
    this.is_step = false,
    this.image = "",
    this.event,
    required this.title,
  });
  final bool is_first;
  final bool is_step;
  final bool is_last;
  final dynamic image;
  final String title;
  final Map? event;

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
                            showModalPopup(context, widget.event);
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
                                    image: (widget.image is String)
                                        ? AssetImage(
                                                "assets/images/${widget.image}")
                                            as ImageProvider
                                        : FileImage(widget.image),
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
                                  showModalPopup(context, widget.event);
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

  Future<dynamic> showModalPopup(BuildContext context, dynamic event) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

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
            onPressed: () {
              Navigator.pop(context);
              if (event["type"] == "step") {
                showAddEventBottomSheet(context, event: event);
              } else {
                Navigator.push(
                  context,
                  PageTransition(
                      child: CreateRealisationScreen(
                        realisation: event,
                      ),
                      type: PageTransitionType.leftToRight,
                      duration: const Duration(milliseconds: 250)),
                );
              }
            },
            child: const AppText(
              'Éditer',
              color: AppColor.purple,
            ),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              userProvider.deleteRealisation(event["id"]);
              Navigator.pop(context);
            },
            child: const AppText(
              'Supprimer',
              color: AppColor.red,
            ),
          ),
        ],
      ),
    );
  }
}
