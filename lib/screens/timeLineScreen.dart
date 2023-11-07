import 'package:flutter/material.dart';
import 'package:hackaton_ifm/widgets/singleTimeLine.dart';
import 'package:indexed/indexed.dart';

class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({super.key});

  @override
  State<TimeLineScreen> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Indexer(
        children: [
          Indexed(
            index: 2,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: double.maxFinite,
                  color: Colors.deepPurple.shade100,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Voyager à travers le monde",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -20,
                  right: 10,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text("Ajouter"),
                  ),
                ),
              ],
            ),
          ),
          Indexed(
            index: 1,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 35),
                child: ListView(
                  children: [
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
            ),
          ),
        ],
      ),
    );
  }
}
