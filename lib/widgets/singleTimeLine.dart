import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_ifm/widgets/timelineCard.dart';
import 'package:timeline_tile/timeline_tile.dart';

class SingleTimeLine extends StatefulWidget {
  SingleTimeLine({
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
  State<SingleTimeLine> createState() => _SingleTimeLineState();
}

class _SingleTimeLineState extends State<SingleTimeLine> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.is_step ? 100 : 250,
      child: TimelineTile(
        isFirst: widget.is_first,
        isLast: widget.is_last,
        beforeLineStyle: LineStyle(
          color: Colors.deepPurple.shade100,
        ),
        indicatorStyle: IndicatorStyle(
          width: 30,
          color:
              widget.is_step ? Colors.deepPurple.shade200 : Colors.deepPurple,
          iconStyle: IconStyle(
            iconData:
                widget.is_step ? Icons.wallet_travel_outlined : Icons.check,
            color: Colors.white,
          ),
        ),
        endChild: widget.is_step
            ? Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : TimeLineCard(
                image: widget.image,
                title: widget.title,
              ),
      ),
    );
  }
}
