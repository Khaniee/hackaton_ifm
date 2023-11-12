import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackaton_ifm/providers/current_user_provider.dart';

class RealisationProvider extends ChangeNotifier {
  List realisations = [
    {
      "id": uuid.v4(),
      "username": "Rakoto Jean Ba",
      "avatar": "https://i.pravatar.cc/300",
      "type": "realisation",
      "title": "Réussir avec mes amis",
      "description": "Je suis trop content pour cette petite victoire.",
      "image": "assets/images/achievement2.jpg",
    },
    {
      "id": uuid.v4(),
      "username": "Tsitana Ny Avo",
      "avatar": "https://i.pravatar.cc/300?img=3",
      "type": "realisation",
      "title": "Première Victoire",
      "description": "La réussite viens avec une dure labeur",
      "image": "assets/images/image1.jpg",
    },
    {
      "id": uuid.v4(),
      "username": "Jean Baptiste",
      "avatar": "https://i.pravatar.cc/300?img=6",
      "type": "realisation",
      "title": "Prouesse Tenue",
      "description": "Pour ma premier participation, on reste souder!",
      "image": "assets/images/image2.jpg",
    }
  ];

  void createRealisation(name, title, description, File image) {
    realisations.insert(0, {
      "id": uuid.v4(),
      "username": name,
      "type": "realisation",
      "title": title,
      "description": description,
      "image": image,
    });
    notifyListeners();
  }
}
