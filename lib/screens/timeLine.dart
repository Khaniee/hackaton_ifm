import 'package:flutter/material.dart';
import 'package:hackaton_ifm/widgets/singleTimeLine.dart';

class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({super.key});

  @override
  State<TimeLineScreen> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: ListView(
          children: [
            SingleTimeLine(
              is_objectif: true,
            ),
            SingleTimeLine(),
            SingleTimeLine(),
            SingleTimeLine(),
            SingleTimeLine(
              is_last: true,
            ),
          ],
        ),
      ),
    );
  }
}
