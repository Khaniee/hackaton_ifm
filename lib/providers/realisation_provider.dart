import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackaton_ifm/providers/current_user_provider.dart';

class RealisationProvider extends ChangeNotifier {
  List realisations = [];

  void createRealisation(title, description, File image) {
    realisations.insert(0, {
      "id": uuid.v4(),
      "type": "realisation",
      "title": title,
      "description": description,
      "image": image,
    });
    notifyListeners();
  }
}
