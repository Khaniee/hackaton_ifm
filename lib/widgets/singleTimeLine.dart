import 'package:flutter/material.dart';
import 'package:hackaton_ifm/widgets/timelineCard.dart';
import 'package:timeline_tile/timeline_tile.dart';

class SingleTimeLine extends StatefulWidget {
  SingleTimeLine(
      {super.key,
      this.is_first = false,
      this.is_last = false,
      this.is_objectif = false});
  bool is_first;
  bool is_last;
  bool is_objectif;
  @override
  State<SingleTimeLine> createState() => _SingleTimeLineState();
}

class _SingleTimeLineState extends State<SingleTimeLine> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: TimelineTile(
        isFirst: widget.is_objectif,
        isLast: widget.is_last,
        afterLineStyle: const LineStyle(
          color: true ? Colors.black : Colors.deepPurple,
        ),
        beforeLineStyle: const LineStyle(
          color: Colors.deepPurple,
        ),
        indicatorStyle: widget.is_objectif
            ? IndicatorStyle(
                width: 50,
                color: Colors.yellow,
                iconStyle: IconStyle(
                  iconData: Icons.grade_outlined,
                  color: Colors.white,
                ),
              )
            : IndicatorStyle(
                width: 40,
                color: Colors.deepPurple,
                iconStyle: IconStyle(
                  iconData: Icons.flood,
                  color: Colors.white,
                ),
              ),
        endChild: TimeLineCard(),
      ),
    );
  }
}
