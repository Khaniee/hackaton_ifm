import 'package:flutter/material.dart';
import 'package:hackaton_ifm/widgets/text.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppText('Who am i'),
      ),
    );
  }
}
