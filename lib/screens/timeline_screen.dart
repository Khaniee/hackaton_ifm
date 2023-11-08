import 'package:flutter/material.dart';
import 'package:hackaton_ifm/data/TimeLineData.dart';
import 'package:hackaton_ifm/widgets/singleTimeLine.dart';
import 'package:indexed/indexed.dart';
import 'package:rive/rive.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimelineScreen> {
  List timelineData = TimeLineData.get();

  StateMachineController? controller;
  SMIInput<double>? inputValue;

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
                  child: Indexer(
                    children: [
                      Indexed(
                        index: 1,
                        child: Container(
                          height: 200,
                          child: RiveAnimation.asset(
                            "assets/images/treedemo.riv",
                            fit: BoxFit.fitHeight,
                            onInit: (artboard) {
                              controller = StateMachineController.fromArtboard(
                                artboard,
                                "Grow",
                              );
                              if (controller != null) {
                                artboard.addController(controller!);
                                inputValue = controller?.findInput("input");
                                inputValue?.change(50);
                              }
                            },
                          ),
                        ),
                      ),
                      const Indexed(
                        index: 2,
                        child: Center(
                          child: Text(
                            "Voyager à travers le monde",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                padding: const EdgeInsets.only(left: 35, top: 160),
                child: ListView(
                    children: List.generate(timelineData.length, (index) {
                  // if(timelineData[index]["type"] == "step"){
                  return SingleTimeLine(
                    title: timelineData[index]["title"],
                    image: timelineData[index]["type"] != "step"
                        ? timelineData[index]["image"]
                        : "",
                    // is_first: index == 0,
                    is_last: index == timelineData.length - 1,
                    is_step: timelineData[index]["type"] == "step",
                  );
                  // }
                })),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
