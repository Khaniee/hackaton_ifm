import 'package:flutter/material.dart';

class CreateRealisationScreen extends StatefulWidget {
  const CreateRealisationScreen({super.key});

  @override
  State<CreateRealisationScreen> createState() =>
      _CreateRealisationScreenState();
}

class _CreateRealisationScreenState extends State<CreateRealisationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("Ajouter réalisation"),
          ],
        ),
      ),
    );
  }
}
