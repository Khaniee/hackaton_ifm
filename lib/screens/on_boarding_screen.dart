import 'package:flutter/material.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:rive/rive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController _controller = PageController();
  StateMachineController? controller;
  SMIInput<double>? inputValue;
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 2), () {
    //   // code to be executed after 2 seconds
    //   inputValue?.change(1);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: const RiveAnimation.asset(
                  "assets/images/age.riv",
                  // fit: BoxFit.fitHeight,
                  // onInit: (artboard) {
                  //   controller = StateMachineController.fromArtboard(
                  //     artboard,
                  //     "age_class",
                  //   );
                  //   if (controller != null) {
                  //     artboard.addController(controller!);
                  //     inputValue = controller?.findInput("input");
                  //     inputValue?.change(0);
                  //   }
                  // },
                ),
              ),
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: RiveAnimation.asset("assets/images/variation.riv"),
              ),
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: RiveAnimation.asset("assets/images/rocket.riv"),
              ),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: SmoothPageIndicator(controller: _controller, count: 3),
          )
        ],
      ),
    );
  }
}
