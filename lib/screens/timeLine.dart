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
        padding: const EdgeInsets.only(left: 35),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(right: 25, top: 10),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade50,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.blue.shade200,
                    size: 35,
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    "Voyager à travers le monde",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue[200],
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text("Ajouter"),
                  ),
                ],
              ),
            ),
            SingleTimeLine(
              is_first: true,
              is_step: true,
            ),
            SingleTimeLine(
              is_step: true,
            ),
            SingleTimeLine(),
            SingleTimeLine(),
            SingleTimeLine(),
            SingleTimeLine(
              is_last: true,
              is_step: true,
            ),
          ],
        ),
      ),
    );
  }
}
