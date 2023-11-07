import 'package:flutter/material.dart';

class TimeLineCard extends StatefulWidget {
  const TimeLineCard({super.key});

  @override
  State<TimeLineCard> createState() => _TimeLineCardState();
}

class _TimeLineCardState extends State<TimeLineCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurple[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            color: Colors.white,
          ),
          Container(
            height: 20,
          )
        ],
      ),
    );
  }
}
